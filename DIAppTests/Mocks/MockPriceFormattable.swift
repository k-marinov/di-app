@testable import DIApp

class MockPriceFormattable: PriceFormattable {

    var mockValue: Int!

    func priceInPences() -> Int {
        return mockValue
    }

}
