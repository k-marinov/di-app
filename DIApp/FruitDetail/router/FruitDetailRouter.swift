import UIKit

class FruitDetailRouter: ViewControllerCreatable, Navigation {

    func showFruitDetail(
        creatable: Creatable,
        fruit: FruitDetailRepresentable,
        animated: Bool = true) {
        let viewController: FruitDetailViewController = createViewController(
            with: FruitDetailViewModel(creatable: creatable, fruit: fruit),
            viewControllerType: FruitDetailViewController.self) as! FruitDetailViewController

        navigationController()?.pushViewController(viewController, animated: animated)
    }

}
