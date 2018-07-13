import RxSwift

class FruitService: Service {

    private var fruitRemote: FruitRemote

    required init(with creatable: Creatable) {
        fruitRemote = creatable.create(with: creatable)
    }

    func findAllFruits(with request: FruitsRequest) -> Observable<[FruitResource]> {
        return fruitRemote.findAllFruits(with: request)
    }

}
