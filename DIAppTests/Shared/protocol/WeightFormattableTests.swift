import XCTest

@testable import FruitApp

class WeightFormattableTests: XCTestCase {

    func testWeightInKilogramsFormatted_whenValueZero_returnsFormatted() {
        let formattable = MockWeightFormattable()
        formattable.mockValue = 0
        XCTAssertEqual(formattable.weightInKilogramsFormatted(), "0.0 kg")
    }

    func testWeightInKilogramsFormatted_whenValue511_returnsFormatted() {
        let formattable = MockWeightFormattable()
        formattable.mockValue = 511
        XCTAssertEqual(formattable.weightInKilogramsFormatted(), "0.511 kg")
    }

}
