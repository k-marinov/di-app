import UIKit
import RxSwift

class FruitsViewController: UIViewController, ModelableViewController {

    @IBOutlet weak var tableView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    private let disposeBag: DisposeBag = DisposeBag()
    private(set) lazy var fruitsViewModel: FruitsViewModel = {
        return self.viewModel as! ProductsViewModel
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
    }

    func subscribe() {
        fruitsViewModel.isLoading
            .asObservable()
            .observeOn(MainScheduler.instance)
            .bind(to: activityIndicatorView.rx.isLoading)
            .disposed(by: disposeBag)

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
