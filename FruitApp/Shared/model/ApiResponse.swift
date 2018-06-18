import Foundation

struct ApiResponse {

    private(set) var resource: Resource?
    private(set) var httpStatusCode: HttpStatusCode!
    private var successHttpStatusCode: HttpStatusCode!

    init<RESOURCE: Resource>(
        resourceType: RESOURCE.Type,
        httpResponse: HttpResponse,
        successHttpStatusCode: HttpStatusCode) {
        self.resource = createResource(resourceType: resourceType, data: httpResponse.data)
        self.httpStatusCode = httpResponse.statusCode()
        self.successHttpStatusCode = successHttpStatusCode
    }

    private func createResource<RESOURCE: Resource>(resourceType: RESOURCE.Type, data: Data?) -> Resource? {
        if hasData(withData: data) {
            do {
                return try JSONDecoder().decode(RESOURCE.self, from: data!)
            } catch let error {
                print("decoding failed log error", error)
            }
        }
        return nil
    }

    private func hasData(withData data: Data?) -> Bool {
        if let data: Data = data, data.count > 0 {
            return true
        }
        return false
    }

    func isSuccess() -> Bool {
        return successHttpStatusCode == httpStatusCode
    }

    func apiFailError() -> ApiError {
        if hasClientError() {
            return ApiError.client
        } else if hasServerError() {
            return ApiError.server
        }
        return ApiError.unknown
    }

    private func hasClientError() -> Bool {
        return HttpStatusCode.clientErrorsGroup.contains(httpStatusCode.rawValue)
    }

    private func hasServerError() -> Bool {
        return HttpStatusCode.serverErrorsGroup.contains(httpStatusCode.rawValue)
    }

}
