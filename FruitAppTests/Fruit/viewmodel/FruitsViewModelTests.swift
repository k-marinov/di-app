import XCTest
import RxSwift

@testable import FruitApp

class FruitsViewModelTests: XCTestCase {

    let disposeBag: DisposeBag = DisposeBag()
    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    var viewModel: FruitsViewModel!
    var reloadDataCollector: RxCollector<Void>!
    var collectionView: UICollectionView!

    override func setUp() {
        super.setUp()
        viewModel = FruitsViewModel(with: creator)
        reloadDataCollector = RxCollector<Void>().collect(from: viewModel.reloadData.asObservable())
    }

    func testLoadFruits_whenSuccess_updatesUi() {
        creator.mockFruitService().isFindAllFruitsSuccess = true
        resetCollectors()

        let expectation = self.expectation(description: "")
        viewModel.loadFruits()
            .subscribe(onError: { error in
                expectation.fulfill()
            }, onCompleted: {
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(reloadDataCollector.results.count, 1)
    }

    func testLoadFruits_whenSuccess_appendsOnceToDataSource() {
        creator.mockFruitService().isFindAllFruitsSuccess = true

        let expectation = self.expectation(description: "")
        viewModel.loadFruits()
            .subscribe(onError: { error in
                expectation.fulfill()
            }, onCompleted: {
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(viewModel.dataSource.count(), 9)
    }

    func testLoadFruits_whenFails_updatesUi() {
        creator.mockFruitService().isFindAllFruitsSuccess = false
        resetCollectors()

        let expectation = self.expectation(description: "")
        viewModel.loadFruits()
            .subscribe(onError: { error in
                expectation.fulfill()
            }, onCompleted: {
                expectation.fulfill()
            }).disposed(by: disposeBag)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(reloadDataCollector.results.count, 0)
    }

    func testDidSelectItem_whenHasProductAtGivenIndexPath_navigatesToProductDetail() {
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        viewModel.dataSource.appendOnce(contentsOf: FruitMother.fruits().fruits)
        viewModel.delegate.tableView(tableView(), didSelectRowAt: indexPath)

        XCTAssertTrue(creator.mockFruitDetailRouter().isShowFruitDetailCalled)
    }

    private func tableView() -> UITableView {
        let frame: CGRect = CGRect(x: 0, y: 0, width: 1256, height: 2560)
        let tableView = UITableView(frame: frame)
        return tableView
    }

    private func resetCollectors() {
        reloadDataCollector.removeAll()
    }

}
