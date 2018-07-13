class FruitsRequest: ApiRequest {

    func httpRequestUrl() -> String {
        return "https://raw.githubusercontent.com/k-marinov/json-resource/master/fruits.json"
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
