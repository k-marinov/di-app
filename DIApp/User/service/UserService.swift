class UserService: Service {

    private let tracker: AnalyticsTracker
    private let httpClient: HttpClient
    private(set) var configuration: String = ""

    convenience init(creatable: Creatable, configuration: String = "DefaultConfiguration") {
        self.init(with: creatable)
        self.configuration = configuration
    }

    required init(with creatable: Creatable) {
        tracker = creatable.create(with: creatable)
        httpClient = creatable.create()
    }

    func name() -> String {
        return "Deckard"
    }

    func age() -> Int {
        return 40
    }

    func sendMessage() -> String {
        if httpClient.request() {
            _ = tracker.trackEvent(name: "Message sent")
            return "Message sent"
        }
        return "Error sending message"
    }

}
