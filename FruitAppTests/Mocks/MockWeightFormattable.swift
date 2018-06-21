@testable import FruitApp

class MockWeightFormattable: WeightFormattable {

    var mockValue: Int!

    func weightInGrams() -> Int {
        return mockValue
    }

}
