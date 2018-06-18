import RxSwift

class FruitRemote {

    private let apiClient: ApiClient

    required init(componentCreatable: ComponentCreatable) {
        apiClient = componentCreatable.create(with: componentCreatable)
    }

    func findAllFruits(with request: FruitsRequest) -> Observable<[FruitResource]> {
        return apiClient.request(with: request)
            .map { ($0.resource as! FruitsResource).fruits }
    }

}
