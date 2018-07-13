protocol ServiceCreatable {

    func create(with creatable: Creatable) -> FruitService

}

extension ServiceCreatable {

    func create(with creatable: Creatable) -> FruitService {
        return FruitService(with: creatable)
    }

}
