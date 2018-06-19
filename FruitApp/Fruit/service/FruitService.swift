import RxSwift

class FruitService: Service {

    private var fruitRemote: FruitRemote

    required init(componentCreatable: ComponentCreatable) {
        fruitRemote = componentCreatable.create(with: componentCreatable)
    }

    func findAllFruits(with request: FruitsRequest) -> Observable<[FruitResource]> {
        return fruitRemote.findAllFruits(with: request)
    }

}
