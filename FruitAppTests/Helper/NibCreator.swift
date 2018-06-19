import UIKit

class NibCreator {

    class func createNib(ofClass aClass: AnyClass, bundle: Bundle? = nil) -> UIView? {
        let nibName: String = NSStringFromClass(aClass).components(separatedBy: ".").last! as String
        let nib: UINib = UINib(nibName: nibName, bundle: bundle)
        let view: UIView? = nib.instantiate(withOwner: nil, options: nil).first as? UIView
        return view
    }

}
