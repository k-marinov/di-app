import Foundation
import XCTest
import RxSwift

@testable import FruitApp

class AnalyticsTrackerTests: XCTestCase {

    private let mocker: AnalyticsHttpMocker = AnalyticsHttpMocker()
    private let tracker: AnalyticsTracker = AnalyticsTracker(with: ComponentCreator())
    private let disposeBag: DisposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        mocker.setUpStubs()
    }

    override func tearDown() {
        mocker.removeStubs()
        super.tearDown()
    }

    func testLogLoadEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: HttpStatusCode?

        let expectation = self.expectation(description: "")
        tracker.logLoadEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, HttpStatusCode.ok)
    }

    func testLogErrorEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: HttpStatusCode?

        let expectation = self.expectation(description: "")
        tracker.logErrorEvent(with: FruitsRequest(), error: ApiError.client)
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, HttpStatusCode.ok)
    }

    func testLogDisplayEvent_whenSuccess_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var statusCode: HttpStatusCode?

        let expectation = self.expectation(description: "")
        tracker.logDisplayEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, HttpStatusCode.ok)
    }

    func testLogDisplayEvent_whenFails_returnsHttpStatusOk() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.fail
        var statusCode: HttpStatusCode?

        let expectation = self.expectation(description: "")
        tracker.logDisplayEvent(startDate: Date())
            .subscribe(onNext: { httpStatusCode in
                statusCode = httpStatusCode
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(statusCode, HttpStatusCode.notFound)
    }

}
