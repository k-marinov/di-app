struct FruitResource: Resource, PriceFormattable, WeightFormattable, FruitDetailRepresentable, TableViewItem {

    private var type: String
    private var price: Int
    private var weight: Int

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        type = try value.decode(String.self, forKey: .type)
        price = try value.decode(Int.self, forKey: .price)
        weight = try value.decode(Int.self, forKey: .weight)
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case price
        case weight
    }

    func name() -> String {
        return type
    }

    func priceInPences() -> Int {
        return price
    }

    func weightInGrams()  -> Int {
        return weight
    }

}
