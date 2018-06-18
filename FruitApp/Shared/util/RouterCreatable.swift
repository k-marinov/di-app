protocol RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitAppRouter

    func create() -> FruitsRouter

    func create() -> FruitDetailRouter

}

extension RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitAppRouter {
        return ShoppingAppRouter(componentCreatable: componentCreatable)
    }

    func create() -> FruitsRouter {
        return ProductsRouter()
    }

    func create() -> FruitDetailRouter {
        return ProductDetailRouter()
    }

}
