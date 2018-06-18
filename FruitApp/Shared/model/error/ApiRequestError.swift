enum ApiRequestError: Error, Equatable {

    case invalidUrl(String)


    static func == (lhs: ApiRequestError, rhs: ApiRequestError) -> Bool {
        switch (lhs, rhs) {
        case (let .invalidUrl(leftMessage), let .invalidUrl(rightMessage)):
            return leftMessage == rightMessage
        }
    }

}
