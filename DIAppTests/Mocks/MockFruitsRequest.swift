@testable import FruitApp

class MockFruitsRequest: FruitsRequest {

    private var url: String
    private var method: HttpMethod

    init(url: String, method: HttpMethod) {
        self.url = url
        self.method = method
    }

    override func httpRequestUrl() -> String {
        return url
    }

    override func httpMethod() -> HttpMethod {
        return method
    }

}
