protocol UtilityCreatable {

    func create(creatable: Creatable) -> AnalyticsTracker

    func create() -> HttpClient

}

extension UtilityCreatable {

    func create(creatable: Creatable) -> AnalyticsTracker {
        return AnalyticsTracker(creatable: creatable)
    }

    func create() -> HttpClient {
        return HttpClient()
    }

}
