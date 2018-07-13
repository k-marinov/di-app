protocol PriceFormattable {

    func priceInPences() -> Int

}

extension PriceFormattable {

    func priceInPoundsAndPencesFormatted() -> String {
        return "£\(Double(priceInPences()) / 100.0)"
    }

}
