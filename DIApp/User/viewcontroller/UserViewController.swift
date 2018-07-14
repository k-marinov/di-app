import UIKit
import RxSwift

class UserViewController: UIViewController {

    var viewModel: UserViewModel!
    @IBOutlet private weak var detailsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }

    private func setDetails()  {
        detailsLabel.text = viewModel.userDetails()
    }

}
