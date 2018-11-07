import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if isProductionEnabled() {
            window?.rootViewController = UINavigationController(rootViewController: userViewController())
            window?.makeKeyAndVisible()
        }
        return true
    }

    func userViewController() -> UserViewController {
        let identifier: String = "\(UserViewController.self)"
        let storyboard: UIStoryboard = UIStoryboard(name: identifier, bundle: nil)

        let viewController: UserViewController = storyboard.instantiateViewController(
            withIdentifier: identifier) as! UserViewController
        viewController.viewModel = UserViewModel(creatable: Creator())
        return viewController
    }

    private func isProductionEnabled() -> Bool {
        return !ProcessInfo.processInfo.arguments.contains("TEST_MODE_ENABLED")
    }

}
