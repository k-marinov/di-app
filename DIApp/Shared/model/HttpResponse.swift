import Foundation

struct HttpResponse {

    private(set) var response: HTTPURLResponse?
    private(set) var data: Data?
    private(set) var error: Error?

    func statusCode() -> HttpStatusCode {
        return HttpStatusCode.findOrReturnUndefined(statusCode: response?.statusCode)
    }

}
