protocol RemoteCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitRemote

}

extension RemoteCreatable {

    func create(with componentCreatable: ComponentCreatable) -> FruitRemote {
        return FruitRemote(with: componentCreatable)
    }

}
