import UIKit

protocol Navigation {

    func navigationController() -> UINavigationController?

}

extension Navigation {

    func navigationController() -> UINavigationController? {
        for window in UIApplication.shared.windows {
            if let rootViewController: UINavigationController = window.rootViewController as? UINavigationController {
                return rootViewController
            }
        }
        return nil
    }

}
