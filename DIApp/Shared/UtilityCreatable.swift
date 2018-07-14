protocol UtilityCreatable {

    func create(with creatable: Creatable) -> AnalyticsTracker

    func create() -> HttpClient

}

extension UtilityCreatable {

    func create(with creatable: Creatable) -> AnalyticsTracker {
        return AnalyticsTracker(with: creatable)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

}
