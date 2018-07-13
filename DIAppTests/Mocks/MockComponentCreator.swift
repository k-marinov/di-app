@testable import DIApp

class MockComponentCreator: Creatable {

    var fruitService: FruitService!
    var fruitDetailRouter: FruitDetailRouter!
    var analyticsTracker: AnalyticsTracker!

    init() {
    }

    func mockFruitService() -> MockFruitService {
        return fruitService as! MockFruitService
    }

    func mockFruitDetailRouter() -> MockFruitDetailRouter {
        return fruitDetailRouter as! MockFruitDetailRouter
    }

    func mockAnalyticsTracker() -> MockAnalyticsTracker {
        return analyticsTracker as! MockAnalyticsTracker
    }

    func create(with creatable: Creatable) -> FruitService {
        return fruitService
    }

    func create() -> FruitDetailRouter {
        return fruitDetailRouter
    }

    class func buildAllMocks() -> MockComponentCreator {
        let creator: MockComponentCreator = MockComponentCreator()
        creator.analyticsTracker = MockAnalyticsTracker(with: creator)
        creator.fruitService = MockFruitService(with: creator)
        creator.fruitDetailRouter = MockFruitDetailRouter()
        return creator
    }

}
