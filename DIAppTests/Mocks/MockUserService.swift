@testable import DIApp

class MockUserService: UserService {

    var mockName: String = ""
    var mockAge: Int = 0

    override func name() -> String {
        return mockName
    }

    override func age() -> Int {
        return mockAge
    }

}
