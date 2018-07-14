class AnalyticsTracker {

    private var httpClient: HttpClient

    init(with creatable: Creatable) {
        httpClient = creatable.create()
    }

    func trackEvent(name: String) -> String {
        if httpClient.request() {
            return "Event tracked =\(name)"
        }
        return "Error"
    }

}
