import RxSwift

class FruitDetailViewModel: ViewModel {

    private(set) var fruitService: FruitService
    private let fruit: FruitDetailRepresentable

    required init(componentCreatable: ComponentCreatable, fruit: FruitDetailRepresentable) {
        fruitService = componentCreatable.create(with: componentCreatable)
        self.fruit = fruit
    }

    func fruitDetail() -> Observable<FruitDetailRepresentable> {
        return Observable<FruitDetailRepresentable>.just(fruit)
    }

}
