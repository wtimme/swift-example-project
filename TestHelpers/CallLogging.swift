public protocol CallLogging {
    func logCall(_ methodIdentifier: String)
}

public class CallLogger {
    public var log = [String]()

    public init() {}
}

extension CallLogger: CallLogging {
    public func logCall(_ methodIdentifier: String) {
        log.append(methodIdentifier)
    }
}
