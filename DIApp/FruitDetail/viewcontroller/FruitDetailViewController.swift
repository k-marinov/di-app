import UIKit
import RxSwift

class FruitDetailViewController: UIViewController, ModelableViewController {

    private let disposeBag: DisposeBag = DisposeBag()
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    private(set) lazy var fruitDetailViewModel: FruitDetailViewModel = {
        return self.viewModel as! FruitDetailViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDetailViewModel.setDisplayStartDateNow()
        subscribe()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fruitDetailViewModel.logDisplayEvent()
    }

    private func subscribe() {
        fruitDetailViewModel.fruitDetail()
            .subscribe(onNext: { [weak self] fruit in
                self?.setUp(detail: fruit)
            }).disposed(by: disposeBag)
    }

    func setUp(detail: FruitDetailRepresentable) {
        priceLabel.text = detail.priceInPoundsAndPencesFormatted()
        weightLabel.text = detail.weightInKilogramsFormatted()
        navigationItem.title = detail.name().capitalized
    }

}
