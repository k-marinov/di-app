import Foundation

@testable import DIApp

class FruitMother {

    class func fruits() -> FruitsResource {
        return try! JSONDecoder().decode(FruitsResource.self, from: fruitsJsonData())
    }

    private class func fruitsJsonData() -> Data {
        return FileHelper().createData(fromFilename: "fruits", ofType: "json")!
    }

    class func emptyFruitsJsonData() -> Data {
        return  "{\"fruit\": []}".data(using: .utf8)!
    }

    class func emptyFruitJson() -> Data {
        return "{}".data(using: .utf8)!
    }

    class func appleJsonData() -> Data {
        return  "{\"type\":\"apple\", \"price\":149, \"weight\":120}".data(using: .utf8)!
    }

}
