import Foundation

public protocol Incrementing {
    func increment(numberToIncrement: Int) -> Int
}

public struct Incrementor: Incrementing {
    public init() {}
    
    public func increment(numberToIncrement: Int) -> Int {
        numberToIncrement + 1
    }
}
