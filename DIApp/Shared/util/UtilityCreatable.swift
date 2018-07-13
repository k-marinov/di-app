protocol UtilityCreatable {

    func create(with creatable: Creatable) -> ApiClient

    func create() -> HttpClient

    func create(with creatable: Creatable) -> AnalyticsTracker

}

extension UtilityCreatable {

    func create(with creatable: Creatable) -> ApiClient {
        return ApiClient(with: creatable)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

    func create(with creatable: Creatable) -> AnalyticsTracker {
        return AnalyticsTracker(with: creatable)
    }

}
