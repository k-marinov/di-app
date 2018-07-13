import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIActivityIndicatorView {

    var isLoading: AnyObserver<Bool> {
        return Binder(self.base) { view, isLoading in
            if isLoading {
                view.startAnimating()
            } else {
                view.stopAnimating()
            }
            }.asObserver()
    }

}
