import Foundation
import RxSwift

struct AnalyticsRequest {

    private(set) var event: AnalyticsEvent

    func asUrlRequest() -> Observable<URLRequest>  {
        return Observable<URLRequest>.create { observer in
            let url: URL? = URL(string: self.urlString())
            if url == nil {
                observer.onError(ApiRequestError.invalidUrl("can not create URL invalid with urlString=\(self.urlString())"))
            } else {
                observer.onNext(self.urlRequest(from: url!))
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    private func urlRequest(from url: URL) -> URLRequest {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 33.0
        return request
    }

    private func urlString() -> String {
        var urlString: String = "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats"
        urlString.append("?")
        urlString.append(event.detail())
        return urlString
    }

}
