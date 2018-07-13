class FruitsRequest: ApiRequest {

    func httpRequestUrl() -> String {
        return "https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
    }

    func httpMethod() -> HttpMethod {
        return HttpMethod.get
    }

    func response(from newResponse: HttpResponse) -> ApiResponse {
        return ApiResponse(
            resourceType: FruitsResource.self,
            httpResponse: newResponse,
            successHttpStatusCode: HttpStatusCode.ok)
    }

}
