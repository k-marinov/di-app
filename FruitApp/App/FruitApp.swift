import UIKit

class FruitApp {

    private let fruitAppRouter: FruitAppRouter
    private let componentCreatable: ComponentCreatable

    required init(with componentCreatable: ComponentCreatable) {
        self.componentCreatable = componentCreatable
        fruitAppRouter = componentCreatable.create(with: componentCreatable)
    }

    func setUp(with window: UIWindow) -> UIWindow {
        return fruitAppRouter.setRootViewController(to: window, componentCreatable: componentCreatable)
    }

}
