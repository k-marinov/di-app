import Foundation
import RxSwift

@testable import DIApp

class MockAnalyticsTracker: AnalyticsTracker {

    override func logLoadEvent(startDate start: Date, currentDate: Date) -> Observable<HttpStatusCode> {
        return Observable.just(HttpStatusCode.ok)
    }

    override func logErrorEvent(with request: ApiRequest, error: ApiError) -> Observable<HttpStatusCode> {
        return Observable.just(HttpStatusCode.ok)
    }

    override func logDisplayEvent(startDate start: Date, currentDate: Date) -> Observable<HttpStatusCode> {
        return Observable.just(HttpStatusCode.ok)
    }

}
