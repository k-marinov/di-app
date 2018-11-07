class UserService: Service {

    private let tracker: AnalyticsTracker
    private let httpClient: HttpClient
    private(set) var configuration: String = ""

    convenience init(creatable: Creatable, configuration: String = "DefaultConfiguration") {
        self.init(creatable: creatable)
        self.configuration = configuration
    }

    required init(creatable: Creatable) {
        tracker = creatable.create(creatable: creatable)
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
