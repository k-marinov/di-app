import RxSwift

class RxCollector<T> {

    var disposeBag: DisposeBag = DisposeBag()
    var results: [T] = [T]()
    var error: Error?

    func collect(from observable: Observable<T>) -> RxCollector {
        observable.asObservable()
            .subscribe(onNext: { (new) in
                self.results.append(new)
            }).disposed(by: disposeBag)
        return self
    }

    func removeAll() {
        results.removeAll()
    }

}
