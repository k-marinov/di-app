protocol UtilityCreatable {

    func create(with componentCreatable: ComponentCreatable) -> ApiClient

    func create() -> HttpClient

    func create(with componentCreatable: ComponentCreatable) -> AnalyticsTracker

}

extension UtilityCreatable {

    func create(with componentCreatable: ComponentCreatable) -> ApiClient {
        return ApiClient(with: componentCreatable)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

    func create(with componentCreatable: ComponentCreatable) -> AnalyticsTracker {
        return AnalyticsTracker(with: componentCreatable)
    }

}
