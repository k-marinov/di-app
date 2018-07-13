@testable import DIApp

class MockWeightFormattable: WeightFormattable {

    var mockValue: Int!

    func weightInGrams() -> Int {
        return mockValue
    }

}
