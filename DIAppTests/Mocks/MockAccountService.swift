@testable import DIApp

class MockAccountService: AccountService {

    var mockBalance: Int = 0

    override func balance() -> Int {
        return mockBalance
    }

}
