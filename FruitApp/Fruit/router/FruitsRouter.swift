import UIKit

class FruitsRouter: ViewControllerCreatable, Navigation {

    func fruitsViewController(_ componentCreatable: ComponentCreatable) -> FruitsViewController {
        return createViewController(
            with: FruitsViewModel(componentCreatable: componentCreatable),
            viewControllerType: FruitsViewController.self) as! FruitsViewController
    }

}
