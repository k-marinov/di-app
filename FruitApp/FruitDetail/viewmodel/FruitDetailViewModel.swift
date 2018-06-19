import RxSwift

class FruitDetailViewModel: ViewModel {

    private(set) var fruitService: FruitService
    private let fruit: FruitResource

    required init(componentCreatable: ComponentCreatable, fruit: FruitResource) {
        fruitService = componentCreatable.create(with: componentCreatable)
        self.fruit = fruit
    }

    func fruitDetail() -> Observable<FruitResource> {
        return Observable<FruitResource>.just(fruit)
    }

}
