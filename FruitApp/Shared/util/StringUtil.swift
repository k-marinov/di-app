class StringUtil {

    class func isNilOrEmpty(_ string: String?) -> Bool {
        switch string {
        case .some(let nonNilString):
            return nonNilString.isEmpty
        default:
            return true
        }
    }

}
