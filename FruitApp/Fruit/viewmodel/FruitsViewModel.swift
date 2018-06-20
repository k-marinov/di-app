import RxSwift

class FruitsViewModel: ViewModel, AnalyticsDisplayTrackable {

    private let disposeBag: DisposeBag = DisposeBag()
    private(set) var isLoading: PublishSubject<Bool> = PublishSubject<Bool>()
    private(set) var reloadData: PublishSubject<Void> = PublishSubject<Void>()
    private(set) var dataSource = TableViewDataSource<FruitResource, FruitCell>()
    private(set) var delegate: TableViewDelegate = TableViewDelegate()
    private(set) var fruitService: FruitService
    private(set) var fruitDetailRouter: FruitDetailRouter
    private var componentCreatable: ComponentCreatable
    private var analyticsTracker: AnalyticsTracker
    var displayEventStartDate: Date!

    required init(componentCreatable: ComponentCreatable) {
        self.componentCreatable = componentCreatable
        fruitService = componentCreatable.create(with: componentCreatable)
        fruitDetailRouter = componentCreatable.create()
        analyticsTracker = componentCreatable.create()
        subscribe()
    }

    func tracker() -> AnalyticsTracker {
        return analyticsTracker
    }

    func rxDisposeBag() -> DisposeBag {
        return disposeBag
    }

    func subscribe() {
        delegate.didSelectRow()
            .map { self.findFruit(at: $0) }
            .subscribe(onNext: { [weak self] fruit in
                guard let `self` = self else { return }
                self.fruitDetailRouter.showFruitDetail(componentCreatable: self.componentCreatable, fruit: fruit)
            }).disposed(by: disposeBag)
    }

    func loadFruits() -> Observable<Void> {
        return fruitService.findAllFruits(with: FruitsRequest())
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] newFruits in
                self?.dataSource.appendOnce(contentsOf: newFruits)
                }, onError: { [weak self] error in
                    self?.onLoadFruitsCompletedWithError()
                }, onCompleted: {  [weak self] in
                    self?.onLoadFruitsCompleted()
                }, onSubscribe: { [weak self] in
                    self?.onLoadFruitsStarted()
            }).map { _ in return () }
    }

    private func findFruit(at indexPath: IndexPath) -> FruitResource {
        return dataSource.findItem(at: indexPath) as! FruitResource
    }

    private func onLoadFruitsStarted() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        isLoading.onNext(true)
    }

    private func onLoadFruitsCompleted() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isLoading.onNext(false)
        reloadData.onNext(())
    }

    private func onLoadFruitsCompletedWithError() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isLoading.onNext(false)
    }

}
