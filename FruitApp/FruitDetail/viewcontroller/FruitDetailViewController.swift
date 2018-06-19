import UIKit
import RxSwift

class FruitDetailViewController: UIViewController, ModelableViewController {

    private let disposeBag: DisposeBag = DisposeBag()


    private(set) lazy var fruitDetailViewModel: FruitDetailViewModel = {
        return self.viewModel as! FruitDetailViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }

    private func subscribe() {

    }
}
