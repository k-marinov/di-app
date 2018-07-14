@testable import DIApp

class MockFriendService: FriendService {

    var mockFriends: [String] = [String]()

    override func findAllFriends() -> [String] {
        return mockFriends
    }

}
