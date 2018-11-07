
class FriendService: Service {

    private let httpClient: HttpClient

    required init(creatable: Creatable) {
        httpClient = creatable.create()
    }

    func findAllFriends() -> [String] {
        if httpClient.request() {
            return ["Phil", "Dimebag", "Vinnie", "Rex"]
        }
        return [String]()
    }

}
