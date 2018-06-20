import Foundation
import RxSwift

protocol AnalyticsDisplayTrackable {

    func tracker() -> AnalyticsTracker

    func rxDisposeBag() -> DisposeBag

    mutating func setDisplayStartDateNow()

    var displayEventStartDate: Date! { get set }
}

extension AnalyticsDisplayTrackable {

    mutating func setDisplayStartDateNow() {
        displayEventStartDate = Date()
    }

    mutating func logDisplayEvent() {
        if displayEventStartDate == nil {
            return
        }
        tracker().logDisplayEvent(startDate: displayEventStartDate)
            .subscribe()
            .disposed(by: rxDisposeBag())
        displayEventStartDate = nil
    }


}
