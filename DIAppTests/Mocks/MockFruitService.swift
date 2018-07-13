import RxSwift

@testable import DIApp

class MockFruitService: FruitService {

    var isFindAllFruitsSuccess = false

    override func findAllFruits(with request: FruitsRequest) -> Observable<[FruitResource]> {
        return isFindAllFruitsSuccess
            ? Observable.just(FruitMother.fruits().fruits)
            : Observable.error(ApiError.client)
    }

}
