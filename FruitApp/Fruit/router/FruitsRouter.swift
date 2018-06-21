import UIKit

class FruitsRouter: ViewControllerCreatable, Navigation {

    func fruitsViewController(with componentCreatable: ComponentCreatable) -> FruitsViewController {
        return createViewController(
            with: FruitsViewModel(with: componentCreatable),
            viewControllerType: FruitsViewController.self) as! FruitsViewController
    }

}
