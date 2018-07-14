@testable import DIApp

class MockCreator: Creatable {

    private let serviceMocks: [String: Service.Type] = [
        "\(UserService.self)": MockUserService.self,
        "\(AccountService.self)": MockAccountService.self,
        "\(FriendService.self)": MockFriendService.self]

    private(set) var mocks: [String: Any] = [String: Any]()

    func addMock(key: String, value: Any) {
        if mocks[key] == nil {
            mocks[key] = value
        }
    }

    func find<Mock>(_ type: Mock.Type) -> Mock {
        return mocks["\(type.self)"] as! Mock
    }

    func create<S: Service>(with creatable: Creatable) -> S {
        let realClassKey: String = "\(S.self)"

        let mockType = mockServiceType(with: creatable, realClassKey: realClassKey)
        addMock(key: "\(mockType)", value: mockType.init(with: creatable))
        return mocks["\(mockType)"] as! S
    }

    func create(with creatable: Creatable) -> AnalyticsTracker {
        let key: String = "\(MockAnalyticsTracker.self)"
        addMock(key: key, value: MockAnalyticsTracker(with: creatable))
        return mocks[key] as! AnalyticsTracker
    }

    func create() -> HttpClient {
        let key: String = "\(MockHttpClient.self)"
        addMock(key: key, value: MockHttpClient())
        return mocks[key] as! HttpClient
    }

    private func mockServiceType(with creatable: Creatable, realClassKey: String) -> Service.Type {
        let mockServiceType: Service.Type? = serviceMocks[realClassKey]
        if mockServiceType == nil {
            fatalError("Service class \(realClassKey) is not mapped to mock service class"
                + "please add your mock class type to serviceMocks")
        }
        print("mock service type \(mockServiceType!) found")
        return mockServiceType!
    }

}
