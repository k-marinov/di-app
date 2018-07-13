import UIKit

class FruitAppRouter: ViewControllerCreatable, Navigation {

    private let fruitsRouter: FruitsRouter

    required init(with componentCreatable: ComponentCreatable) {
        fruitsRouter = componentCreatable.create()
    }

    func setRootViewController(to window: UIWindow, componentCreatable: ComponentCreatable) -> UIWindow {
        let viewController = fruitsRouter.fruitsViewController(with: componentCreatable)
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
