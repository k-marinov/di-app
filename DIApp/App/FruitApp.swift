import UIKit

class FruitApp {

    private let fruitAppRouter: FruitAppRouter
    private let creatable: Creatable

    required init(with creatable: Creatable) {
        self.creatable = creatable
        fruitAppRouter = creatable.create(with: creatable)
    }

    func setUp(with window: UIWindow) -> UIWindow {
        return fruitAppRouter.setRootViewController(to: window, creatable: creatable)
    }

}
