import UIKit

class FruitsRouter: ViewControllerCreatable, Navigation {

    func fruitsViewController(with creatable: Creatable) -> FruitsViewController {
        return createViewController(
            with: FruitsViewModel(with: creatable),
            viewControllerType: FruitsViewController.self) as! FruitsViewController
    }

}
