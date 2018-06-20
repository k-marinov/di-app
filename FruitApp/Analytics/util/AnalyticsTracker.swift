import Foundation
import RxSwift

class AnalyticsTracker {

    private let httpClient: HttpClient = HttpClient()

    func logDisplayEvent(startDate start: Date, currentDate: Date = Date()) -> Observable<HttpStatusCode> {
        let detail = AnalyticsEventDetail(description: elapsedTimeInMilliseconds(startDate: start, currentDate: currentDate))
        let event = AnalyticsEvent.display(detail)
        return logEvent(with: event)
    }

    func logLoadEvent(startDate start: Date, currentDate: Date = Date()) -> Observable<HttpStatusCode> {
        let detail = AnalyticsEventDetail(description: elapsedTimeInMilliseconds(startDate: start, currentDate: currentDate))
        let event = AnalyticsEvent.load(detail)
        return logEvent(with: event)
    }

    private func elapsedTimeInMilliseconds(startDate start: Date, currentDate: Date) -> String {
        let elapsed: Double = currentDate.timeIntervalSince(start) * 1000
        return "\(elapsed)"
    }

    func logErrorEvent(with request: ApiRequest, error: ApiError) -> Observable<HttpStatusCode> {
        let detail = AnalyticsEventDetail(description: "request to =\(request.httpRequestUrl())"
            + "failed with api error type\(error)")
        return logEvent(with: AnalyticsEvent.error(detail))
    }

    func logEvent(with event: AnalyticsEvent) -> Observable<HttpStatusCode> {
        let request: AnalyticsRequest = AnalyticsRequest(event: event)
        return request.asUrlRequest()
            .flatMap { [weak self] urlRequest -> Observable<HttpResponse> in
                guard let `self` = self else { return Observable.empty() }
                return self.httpClient.request(urlRequest: urlRequest)
            }.map { response in
                return response.statusCode()
        }
    }

}
