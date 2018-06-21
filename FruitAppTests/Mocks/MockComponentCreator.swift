@testable import FruitApp

class MockComponentCreator: ComponentCreatable {

    var fruitService: FruitService!
    var fruitDetailRouter: FruitDetailRouter!

    init() {
    }

    func mockFruitService() -> MockFruitService {
        return fruitService as! MockFruitService
    }

    func mockFruitDetailRouter() -> MockFruitDetailRouter {
        return fruitDetailRouter as! MockFruitDetailRouter
    }

    func create(with componentCreatable: ComponentCreatable) -> FruitService {
        return fruitService
    }

    func create() -> FruitDetailRouter {
        return fruitDetailRouter
    }

    class func buildAllMocks() -> MockComponentCreator {
        let creator: MockComponentCreator = MockComponentCreator()
        creator.fruitService = MockFruitService(with: creator)
        creator.fruitDetailRouter = MockFruitDetailRouter()
        return creator
    }

}
