import UIKit

@testable import FruitApp

class MockFruitDetailRouter: FruitDetailRouter {

    var isShowFruitDetailCalled = false

    override func showFruitDetail(componentCreatable: ComponentCreatable, fruit: FruitDetailRepresentable, animated: Bool) {
        isShowFruitDetailCalled = true
    }

}
