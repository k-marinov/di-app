import XCTest

@testable import DIApp

class UserServiceTests: XCTestCase {

    var creator: MockCreator!
    var userService: UserService!

    override func setUp() {
        super.setUp()
        creator = MockCreator()
        userService = UserService(with: creator)
        XCTAssertEqual(creator.mocks.count, 2)
    }

    func testSendMessage_whenSuccess_returnsSuccessMessage() {
        creator.find(MockHttpClient.self).isRequestSuccess = true
        XCTAssertEqual(userService.sendMessage(), "Message sent")
    }

    func testSendMessage_whenFails_returnsErrorMessage() {
        creator.find(MockHttpClient.self).isRequestSuccess = false
        XCTAssertEqual(userService.sendMessage(), "Error sending message")
    }

    func testSendMessage_whenFails_doesNotTracksEvent() {
        creator.find(MockHttpClient.self).isRequestSuccess = false
        _ = userService.sendMessage()
        XCTAssertFalse(creator.find(MockAnalyticsTracker.self).isTrackEventCalled)
    }

}
