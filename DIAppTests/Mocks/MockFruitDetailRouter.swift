import UIKit

@testable import DIApp

class MockFruitDetailRouter: FruitDetailRouter {

    var isShowFruitDetailCalled = false

    override func showFruitDetail(creatable: Creatable, fruit: FruitDetailRepresentable, animated: Bool) {
        isShowFruitDetailCalled = true
    }

}
