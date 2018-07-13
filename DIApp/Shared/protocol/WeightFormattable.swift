protocol WeightFormattable {

    func weightInGrams() -> Int

    func weightInKilogramsFormatted() -> String
    
}

extension WeightFormattable {

    func weightInKilogramsFormatted() -> String {
        return "\(Double(weightInGrams()) / 1000.0) kg"
    }

}
