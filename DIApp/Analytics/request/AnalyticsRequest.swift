import Foundation
import RxSwift

struct AnalyticsRequest {

    private(set) var event: AnalyticsEvent

    func asUrlRequest() -> URLRequest {
        let url: URL = URL(string: self.urlString())!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 33.0
        return request
    }

    private func urlString() -> String {
        var urlString: String = "https://raw.githubusercontent.com/k-marinov/json-resource/master/fruits.json"
        urlString.append("?")
        urlString.append(event.detail())
        return urlString
    }

}
