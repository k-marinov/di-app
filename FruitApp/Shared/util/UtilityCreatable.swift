protocol UtilityCreatable {

    func create(with componentCreatable: ComponentCreatable) -> ApiClient

    func create() -> HttpClient

    func create() -> AnalyticsTracker

}

extension UtilityCreatable {

    func create(with componentCreatable: ComponentCreatable) -> ApiClient {
        return ApiClient(componentCreatable: componentCreatable)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

    func create() -> AnalyticsTracker {
        return AnalyticsTracker()
    }

}
