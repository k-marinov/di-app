import XCTest
import RxSwift

@testable import FruitApp

class AnalyticsEventTests: XCTestCase {

    func testDetail_WhenCreatedWithTypeError_returnsEventErrorUrlAsQueryParameters() {
        let event = AnalyticsEvent.error(AnalyticsEventDetail(description: "failed api"))
        XCTAssertEqual(event.detail(), "event=error&data=failed%20api")
    }

    func testDetail_WhenCreatedWithTypeDisplay_returnsEventDisplayAsUrlAsQueryParameters() {
        let event = AnalyticsEvent.display(AnalyticsEventDetail(description: "2000"))
        XCTAssertEqual(event.detail(), "event=display&data=2000")
    }

    func testDetail_WhenCreatedWithTypeLoad_returnsEventLoadAsUrlAsQueryParameters() {
        let event = AnalyticsEvent.load(AnalyticsEventDetail(description: "1000"))
        XCTAssertEqual(event.detail(), "event=load&data=1000")
    }

}
