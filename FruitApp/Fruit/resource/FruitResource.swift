struct FruitResource: Resource, TableViewItem {

    private(set) var type: String
    private(set) var price: Int
    private(set) var weight: Int

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

}
