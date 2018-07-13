protocol RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitAppRouter

    func create() -> FruitsRouter

    func create() -> FruitDetailRouter

}

extension RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitAppRouter {
        return FruitAppRouter(with: componentCreatable)
    }

    func create() -> FruitsRouter {
        return FruitsRouter()
    }

    func create() -> FruitDetailRouter {
        return FruitDetailRouter()
    }

}
