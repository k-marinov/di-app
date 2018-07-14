import XCTest

@testable import DIApp

class UserViewModelTests: XCTestCase {

    var creator: MockCreator!
    var userViewModel: UserViewModel!

    override func setUp() {
        super.setUp()
        creator = MockCreator()
        userViewModel = UserViewModel(with: creator)
    }

    func testUserDetails_whenHasName_appendsName() {
        creator.find(MockUserService.self).mockName = "Neo"
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\n")
    }

    func testUserDetails_whenHasEmptyName_doesNotAppend() {
        creator.find(MockUserService.self).mockName = ""
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenAgeHigherThanZero_appendsAge() {
        creator.find(MockUserService.self).mockAge = 69
        XCTAssertEqual(userViewModel.userDetails(), "age: 69\n")
    }

    func testUserDetails_whenAgeEqualsZero_doesNotAppend() {
        creator.find(MockUserService.self).mockAge = 0
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenHasNameAndAge_appendsNameAndAge() {
        creator.find(MockUserService.self).mockName = "Neo"
        creator.find(MockUserService.self).mockAge = 69
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\nage: 69\n")
    }

    func testUserDetails_whenBalanceHigherThanZero_appendsBalance() {
        creator.find(MockAccountService.self).mockBalance = 400
        XCTAssertEqual(userViewModel.userDetails(), "account: 400\n")
    }

    func testUserDetails_whenBalanceEqualsToZero_doesNotAppend() {
        creator.find(MockAccountService.self).mockBalance = 0
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenHasFriends_appendsFriends() {
        creator.find(MockFriendService.self).mockFriends = ["Friend1", "Friend2"]
        XCTAssertEqual(userViewModel.userDetails(), "friends: Friend1 Friend2")
    }

    func testUserDetails_whenDoesNotHaveFriends_doesNotAppend() {
        creator.find(MockFriendService.self).mockFriends = []
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

    func testUserDetails_whenAllValid_returnsAllUserDetails() {
        creator.find(MockUserService.self).mockName = "Neo"
        creator.find(MockUserService.self).mockAge = 69
        creator.find(MockAccountService.self).mockBalance = 400
        creator.find(MockFriendService.self).mockFriends = ["Friend1", "Friend2"]
        XCTAssertEqual(userViewModel.userDetails(), "name: Neo\n" + "age: 69\n" + "account: 400\n" + "friends: Friend1 Friend2")
    }

    func testUserDetails_whenAllInvalid_returnsEmpty() {
        creator.find(MockUserService.self).mockName = ""
        creator.find(MockUserService.self).mockAge = 0
        creator.find(MockAccountService.self).mockBalance = -1
        creator.find(MockFriendService.self).mockFriends = []
        XCTAssertEqual(userViewModel.userDetails(), "")
    }

}

