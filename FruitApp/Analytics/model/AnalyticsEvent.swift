import Foundation

enum AnalyticsEvent {

    case load(AnalyticsEventDetail)

    case display(AnalyticsEventDetail)

    case error(AnalyticsEventDetail)


    func detail() -> String {
        switch self {
        case let .load(detail):
            return "event=load&data=" + detail.urlQueryAllowed()
        case let .display(detail):
            return "event=display&data=" + detail.urlQueryAllowed()
        case let .error(detail):
            return "event=error&data=" + detail.urlQueryAllowed()
        }
    }

}
