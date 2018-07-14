@testable import DIApp

class MockHttpClient: HttpClient {

    var isRequestSuccess: Bool = false

    override func request() -> Bool {
        return isRequestSuccess
    }

}
