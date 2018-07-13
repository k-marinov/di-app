protocol RouterCreatable {

    func create(with creatable: Creatable) -> FruitAppRouter

    func create() -> FruitsRouter

    func create() -> FruitDetailRouter

}

extension RouterCreatable {

    func create(with creatable: Creatable) -> FruitAppRouter {
        return FruitAppRouter(with: creatable)
    }

    func create() -> FruitsRouter {
        return FruitsRouter()
    }

    func create() -> FruitDetailRouter {
        return FruitDetailRouter()
    }

}
