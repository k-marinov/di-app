import XCTest
import RxSwift

@testable import DIApp

class ApiRequestTests: XCTestCase {

    private let disposeBag: DisposeBag = DisposeBag()

    func testAsURLRequest_whenHasInvalidUrl_throwsApiRequestError() {
        let request: MockFruitsRequest = MockFruitsRequest(url: "ahrotro:***>$$£$%$5", method: HttpMethod.get)
        XCTAssertThrowsError(try request.asURLRequest()) { error -> Void in
            let apiRequestError: ApiRequestError = ApiRequestError.invalidUrl(
                "can not create URL invalid with httpRequestUrl=ahrotro:***>$$£$%$5")
            XCTAssertEqual((error as! ApiRequestError), apiRequestError)
        }
    }

    func testAsURLRequest_whenValidUrl_returnsURLRequest() {
        let request: MockFruitsRequest = MockFruitsRequest(url: "http://shopping.com/product/1", method: HttpMethod.get)
        let contentTypeHeaderValue: String? = try! request.asURLRequest().allHTTPHeaderFields?["Content-Type"]
        let httpMethod: String? = try! request.asURLRequest().httpMethod
        let cachePolicy: URLRequest.CachePolicy = try! request.asURLRequest().cachePolicy
        let timeoutInterval: TimeInterval = try! request.asURLRequest().timeoutInterval

        XCTAssertEqual(contentTypeHeaderValue, "application/json")
        XCTAssertEqual(httpMethod, "GET")
        XCTAssertEqual(cachePolicy, URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
        XCTAssertEqual(timeoutInterval, 30)
    }

    func testResponse_whenHasHttpResponseError_returnsApiErrorNetwork() {
        var apiError: ApiError?
        let request: MockFruitsRequest = MockFruitsRequest(url: "http://shopping.com/product/1", method: HttpMethod.get)
        let response: HttpResponse = HttpResponseMother.emptyHttpResponse(withStatusCode: -1)

        let expectation = self.expectation(description: "")
        request.response(from: response)
            .subscribe(onError: { error in
                apiError = error as? ApiError
                expectation.fulfill()
            }, onCompleted: {
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.network)
    }

    func testResponse_whenHasHttpResponseWithStatusCode400_returnsClientError() {
        var apiError: ApiError?
        let request: MockFruitsRequest = MockFruitsRequest(url: "http://shopping.com/fruit/1", method: HttpMethod.get)
        let response: HttpResponse = HttpResponseMother.httpResponse(withStatusCode: 400)

        let expectation = self.expectation(description: "")
        request.response(from: response)
            .subscribe(onError: { error in
                apiError = error as? ApiError
                expectation.fulfill()
            }, onCompleted: {
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.client)
    }

    func testResponse_whenHasHttpResponseWithValidData_returnsApiResponse() {
        var apiError: ApiError?
        var apiResponse: ApiResponse?
        let request: MockFruitsRequest = MockFruitsRequest(url: "http://shopping.com/fruit", method: HttpMethod.get)
        let response: HttpResponse = HttpResponseMother.httpResponse(withStatusCode: 200)

        let expectation = self.expectation(description: "")
        request.response(from: response)
            .subscribe(onNext: { response in
                apiResponse = response
                expectation.fulfill()
            }, onError: { error in
                apiError = error as? ApiError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertNil(apiError)
        XCTAssertNotNil(apiResponse)
        XCTAssertNotNil(apiResponse?.resource is FruitsResource)
    }

}
