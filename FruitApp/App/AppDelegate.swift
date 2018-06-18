import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let fruitApp: FruitApp = FruitApp(componentCreatable: ComponentCreator())
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if isProductionEnabled() {
            _ = fruitApp.setUp(with: window!)
        }
        return true
    }

    private func isProductionEnabled() -> Bool {
        return !ProcessInfo.processInfo.arguments.contains("TEST_MODE_ENABLED")
    }

}
