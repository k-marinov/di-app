class AnalyticsTracker {

    private var httpClient: HttpClient

    init(creatable: Creatable) {
        httpClient = creatable.create()
    }

    func trackEvent(name: String) -> String {
        if httpClient.request() {
            return "Event tracked =\(name)"
        }
        return "Error"
    }

}
