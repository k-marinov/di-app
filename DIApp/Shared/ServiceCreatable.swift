protocol ServiceCreatable {

    func create<S: Service>(with creatable: Creatable) -> S

}

extension ServiceCreatable {

    func create<S: Service>(with creatable: Creatable) -> S {
        return S(with: creatable)
    }

}
