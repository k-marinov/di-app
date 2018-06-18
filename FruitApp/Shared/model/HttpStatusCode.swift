import Foundation

enum HttpStatusCode: Int {

    static let clientErrorsGroup: CountableClosedRange<Int> = (400...499)

    static let serverErrorsGroup: CountableClosedRange<Int> = (500...599)

    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case imUsed = 226

    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case switchProxy = 306
    case temporaryRedirect = 307
    case permanentRedirect = 308

    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case uriTooLong = 414
    case unsupportedMediaType = 415
    case rangeNotSatisfiable = 416
    case expectationFailed = 417
    case teapot = 418
    case misdirectedRequest = 421
    case unprocessedEntity = 422
    case locked = 423
    case failedDependency = 424
    case upgradeRequired = 425
    case preconditionRequired = 426
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451

    case internalServerError = 500
    case notImplemented = 501
    case badGateaway = 502
    case serviceUnavailable = 503
    case gateawayTimeOut = 504
    case httpVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case notExtended = 510
    case networkAuthenticationRequired = 511
    case bandwidthLimitExcedeed = 509
    case siteIsFrozen = 530
    case networkReadTimeOutError = 598
    case networkConnectTimeOutError = 599
    case undefined = -1

    static func findOrReturnUndefined(statusCode: Int?) -> HttpStatusCode {
        if let statusCode: Int = statusCode,
            let httpStatusCode: HttpStatusCode = HttpStatusCode(rawValue: statusCode) {
            return httpStatusCode
        }
        return HttpStatusCode(rawValue: HttpStatusCode.undefined.rawValue)!
    }

}
