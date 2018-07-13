import XCTest
import RxSwift

@testable import DIApp

class FruitServiceTests: XCTestCase {

    private let mocker: FruitHttpMocker = FruitHttpMocker()
    private let service: FruitService = FruitService(with: Creator())
    private let disposeBag: DisposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        mocker.setUpStubs()
    }

    override func tearDown() {
        mocker.removeStubs()
        super.tearDown()
    }

    func testFindAllFruits_whenSuccess_returnsFruits() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.success
        var fruits: [FruitResource] = [FruitResource]()

        let expectation = self.expectation(description: "")
        service.findAllFruits(with: FruitsRequest())
            .subscribe(onNext: { newFruits in
                fruits.append(contentsOf: newFruits)
                expectation.fulfill()
            }, onError: { error in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(fruits.count, 9)
    }

    func testFindAllFruits_whenFails_returnsApiErrorClient() {
        FruitHttpMocker.scenario = FruitHttpMocker.Scenario.fail
        var apiError: ApiError?

        let expectation = self.expectation(description: "")
        service.findAllFruits(with: FruitsRequest())
            .subscribe(onNext: { _ in
                expectation.fulfill()
            }, onError: { error in
                apiError = error as? ApiError
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.client)
    }

}
