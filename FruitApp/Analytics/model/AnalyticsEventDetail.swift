import Foundation

struct AnalyticsEventDetail {

    private(set) var description: String

    func urlQueryAllowed() -> String {
        return  description.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }

}
