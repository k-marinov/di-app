protocol WeightFormattable {

    func weightInGrams() -> Int

}

extension WeightFormattable {

    func weightInKilograms() -> String {
        return "\(Double(weightInGrams()) / 1000.0) kg"
    }

}
