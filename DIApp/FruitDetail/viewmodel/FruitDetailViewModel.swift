import RxSwift

class FruitDetailViewModel: ViewModel, AnalyticsDisplayTrackable {

    private(set) var fruitService: FruitService
    private let fruit: FruitDetailRepresentable
    private var analyticsTracker: AnalyticsTracker
    private let disposeBag: DisposeBag = DisposeBag()
    var displayEventStartDate: Date?

    required init(creatable: Creatable, fruit: FruitDetailRepresentable) {
        fruitService = creatable.create(with: creatable)
        analyticsTracker = creatable.create(with: creatable)
        self.fruit = fruit
    }

    func fruitDetail() -> Observable<FruitDetailRepresentable> {
        return Observable<FruitDetailRepresentable>.just(fruit)
    }

    func tracker() -> AnalyticsTracker {
        return analyticsTracker
    }

    func rxDisposeBag() -> DisposeBag {
        return disposeBag
    }

}
