
struct FruitsResource: Resource {

    private(set) var fruits: [FruitResource] = [FruitResource]()

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        fruits = try value.decode([FruitResource].self, forKey: .fruit)
    }

    private enum CodingKeys: String, CodingKey {
        case fruit = "fruit"
    }

}
