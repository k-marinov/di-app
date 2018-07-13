@testable import DIApp

class MockCreator: Creatable {

    var mocks: [String: Any] = [String: Any]()

    func addOnce(key: String, value: Any) {
        if mocks[key] == nil {
            mocks[key] = value
        }
    }
    func find<Mock>(_ type: Mock.Type) -> Mock {
        return mocks["\(type.self)"] as! Mock
    }

    func create(with creatable: Creatable) -> FruitService {
        let key: String = "\(MockFruitService.self)"
        addOnce(key: key, value: MockFruitService(with: creatable))
        return mocks[key] as! FruitService
    }

    func create() -> FruitDetailRouter {
        let key: String = "\(MockFruitDetailRouter.self)"
        addOnce(key: key, value: MockFruitDetailRouter())
        return mocks[key] as! FruitDetailRouter
    }

    func create(with creatable: Creatable) -> AnalyticsTracker {
        let key: String = "\(MockAnalyticsTracker.self)"
        addOnce(key: key, value: MockAnalyticsTracker(with: creatable))
        return mocks[key] as! AnalyticsTracker
    }

}
