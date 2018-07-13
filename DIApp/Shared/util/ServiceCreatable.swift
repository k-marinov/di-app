protocol ServiceCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitService

}

extension ServiceCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitService {
        return FruitService(with: componentCreatable)
    }

}
