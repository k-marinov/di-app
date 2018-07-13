import RxSwift

class FruitRemote {

    private let apiClient: ApiClient

    required init(with creatable: Creatable) {
        apiClient = creatable.create(with: creatable)
    }

    func findAllFruits(with request: FruitsRequest) -> Observable<[FruitResource]> {
        return apiClient.request(with: request)
            .map { ($0.resource as! FruitsResource).fruits }
    }

}
