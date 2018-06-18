import Foundation
import RxSwift

class ApiClient {

    private let httpClient: HttpClient

    required init(componentCreatable: ComponentCreatable) {
        httpClient = componentCreatable.create()
    }

    func request(with request: ApiRequest) -> Observable<ApiResponse> {
        return httpClient.request(urlRequest: try! request.asURLRequest())
            .flatMap { newResponse in
                return request.response(from: newResponse)
        }
    }

}
