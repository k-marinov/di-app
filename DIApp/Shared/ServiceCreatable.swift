protocol ServiceCreatable {

    func create<SERVICE: Service>(creatable: Creatable) -> SERVICE

}

extension ServiceCreatable {

    func create<SERVICE: Service>(creatable: Creatable) -> SERVICE {
        return SERVICE(creatable: creatable)
    }

}
