@testable import FruitApp

class MockPriceFormattable: PriceFormattable {

    var mockValue: Int!

    func priceInPences() -> Int {
        return mockValue
    }

}
