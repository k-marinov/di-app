protocol Service {

    init(with creatable: Creatable)

    init()

}

extension Service {

    init(with creatable: Creatable) {
        self.init()
    }

    init() {
        self.init()
    }

}
