import Foundation
@testable import Framework
import TestHelpers
import XCTest

// sourcery:mock_inline
public class MockIncrementor: Incrementing {
    // sourcery:inline:MockIncrementor.mock
    // swiftlint:disable all

    public var callLogger: CallLogging?
    public func setupToLogCalls(with callLogger: CallLogging) -> Self {
        self.callLogger = callLogger

        return self
    }

    // MARK: - increment

    public static let incrementCallId = "MockIncrementor.increment"

    public private(set) var invokedIncrement = false
    public private(set) var invokedIncrementCount = 0

    /// Use this to verify the parameters of the last invocation of `increment(...)`.
    public var invokedIncrementParameters: (numberToIncrement: Int, Void)? {
        invokedIncrementParametersList.last
    }

    /// Use this when `increment(...)` is called _multiple_ times
    /// and you want to verify the parameters of each invocation.
    ///
    /// If you are only interested in one single invocation, please use `invokedIncrementParameters` instead.
    public private(set) var invokedIncrementParametersList = [(numberToIncrement: Int, Void)]()
    public var invokedIncrementExpectation: XCTestExpectation?

    /// Use this property to control the return value of `increment(...)`.
    public var stubbedIncrementResult: Int = 0
    public var stubbedIncrementResultProvider: ((_ numberToIncrement: Int) -> Int)?

    public func increment(numberToIncrement: Int) -> Int {
        defer {
            callLogger?.logCall(Self.incrementCallId)

            invokedIncrementExpectation?.fulfill()
        }
        invokedIncrement = true
        invokedIncrementCount += 1
        invokedIncrementParametersList.append((numberToIncrement: numberToIncrement, ()))
        let result: Int = if let resultProvider = stubbedIncrementResultProvider {
            resultProvider(numberToIncrement)
        } else {
            /// Did you encounter "Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value"?
            /// Consider setting a stubbed return value for this method via `stubbedIncrementResult`.
            stubbedIncrementResult
        }
        return result
    }

    // MARK: - reset Mock

    public func resetMock(includingStubbedData: Bool = false) {
        invokedIncrement = false
        invokedIncrementCount = 0
        invokedIncrementParametersList = [(numberToIncrement: Int, Void)]()
        invokedIncrementExpectation = nil
        stubbedIncrementResult = includingStubbedData ? 0 : stubbedIncrementResult
        stubbedIncrementResultProvider = includingStubbedData ? nil : stubbedIncrementResultProvider
    }

    // swiftlint:enable all
    // sourcery:end

    public init() {}
}
