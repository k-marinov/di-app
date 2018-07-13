protocol RemoteCreatable {

    func create(with creatable: Creatable) -> FruitRemote

}

extension RemoteCreatable {

    func create(with creatable: Creatable) -> FruitRemote {
        return FruitRemote(with: creatable)
    }

}
