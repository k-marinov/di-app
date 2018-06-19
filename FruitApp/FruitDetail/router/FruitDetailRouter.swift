import UIKit

class FruitDetailRouter: ViewControllerCreatable, Navigation {

    func showFruitDetail(
        componentCreatable: ComponentCreatable,
        fruit: FruitDetailRepresentable,
        animated: Bool = true) {
        let viewController: FruitDetailViewController = createViewController(
            with: FruitDetailViewModel(componentCreatable: componentCreatable, fruit: fruit),
            viewControllerType: FruitDetailViewController.self) as! FruitDetailViewController

        navigationController()?.pushViewController(viewController, animated: animated)
    }

}
