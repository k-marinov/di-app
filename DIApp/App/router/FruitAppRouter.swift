import UIKit

class FruitAppRouter: ViewControllerCreatable, Navigation {

    private let fruitsRouter: FruitsRouter

    required init(with creatable: Creatable) {
        fruitsRouter = creatable.create()
    }

    func setRootViewController(to window: UIWindow, creatable: Creatable) -> UIWindow {
        let viewController = fruitsRouter.fruitsViewController(with: creatable)
        window.rootViewController = rootNavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        return window
    }

    private func rootNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.gray]
        controller.navigationBar.tintColor = UIColor.gray
        return controller
    }

}
