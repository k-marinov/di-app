import XCTest
import RxSwift

@testable import DIApp

class FruitsViewControllerTests: XCTestCase, ViewControllerCreatable {

    let disposeBag: DisposeBag = DisposeBag()
    var creator: MockCreator!
    var viewController: FruitsViewController!

    override func setUp() {
        super.setUp()
        creator = MockCreator()
        viewController = fruitsViewController()
    }

    func testViewDidLoad_whenViewControllerIsLoaded_loadsFruits() {
        creator.find(MockFruitService.self).isFindAllFruitsSuccess = true

        let expectation = self.expectation(description: "")
        viewController.fruitsViewModel
            .reloadData.subscribe(onNext: { _ in
                expectation.fulfill()
            }, onError: { _ in
                expectation.fulfill()
            }).disposed(by: disposeBag)
        _ = viewController.view
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(viewController.tableView.numberOfRows(inSection: 0), 9)
    }

    func testViewDidLoad_whenViewControllerIsLoaded_setsUpTableViewDataSourceAndDelegate() {
        creator.find(MockFruitService.self).isFindAllFruitsSuccess = true
        _ = viewController.view

        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertNotNil(viewController.tableView.delegate)
    }

    private func fruitsViewController() -> FruitsViewController {
        return createViewController(
            with: FruitsViewModel(with: creator),
            viewControllerType: FruitsViewController.self)
            as! FruitsViewController
    }

}
