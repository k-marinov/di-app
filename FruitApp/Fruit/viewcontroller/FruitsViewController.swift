import UIKit
import RxSwift

class FruitsViewController: UIViewController, ModelableViewController {

    private let disposeBag: DisposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    private(set) lazy var fruitsViewModel: FruitsViewModel = {
        return self.viewModel as! FruitsViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        subscribe()
        fruitsViewModel.loadFruits()
            .subscribe()
            .disposed(by: disposeBag)
    }

    private func setUp() {
        setUpTableView()
        setUpNavigationBarTitle()
    }

    func subscribe() {
        fruitsViewModel.reloadData
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
    }

    private func setUpTableView() {
        tableView.dataSource = fruitsViewModel.dataSource
        tableView.delegate = fruitsViewModel.delegate
    }

    private func setUpNavigationBarTitle() {
        navigationItem.title = "Fruits"
    }

}
