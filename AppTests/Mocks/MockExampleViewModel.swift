@testable import App
import Foundation
import TestHelpers
import XCTest

// sourcery:mock_inline
public class MockExampleViewModel: Example.ViewModelProtocol {
    // sourcery:inline:MockExampleViewModel.mock
    // swiftlint:disable all

    public var callLogger: CallLogging?
    public func setupToLogCalls(with callLogger: CallLogging) -> Self {
        self.callLogger = callLogger

        return self
    }

    // MARK: - title

    public static let titleGetterCallId = "MockExampleViewModel.getTitle"

    public private(set) var invokedTitleGetter = false
    public private(set) var invokedTitleGetterCount = 0
    public private(set) var invokedTitleGetterExpectation: XCTestExpectation?
    public var stubbedTitle: String = ""

    public var title: String {
        defer {
            callLogger?.logCall(Self.titleGetterCallId)

            invokedTitleGetterExpectation?.fulfill()
        }
        invokedTitleGetter = true
        invokedTitleGetterCount += 1
        return stubbedTitle
    }

    // MARK: - currentValueText

    public static let currentValueTextGetterCallId = "MockExampleViewModel.getCurrentValueText"

    public private(set) var invokedCurrentValueTextGetter = false
    public private(set) var invokedCurrentValueTextGetterCount = 0
    public private(set) var invokedCurrentValueTextGetterExpectation: XCTestExpectation?
    public var stubbedCurrentValueText: String = ""

    public var currentValueText: String {
        defer {
            callLogger?.logCall(Self.currentValueTextGetterCallId)

            invokedCurrentValueTextGetterExpectation?.fulfill()
        }
        invokedCurrentValueTextGetter = true
        invokedCurrentValueTextGetterCount += 1
        return stubbedCurrentValueText
    }

    // MARK: - didTapIncrementButton

    public static let didTapIncrementButtonCallId = "MockExampleViewModel.didTapIncrementButton"

    public private(set) var invokedDidTapIncrementButton = false
    public private(set) var invokedDidTapIncrementButtonCount = 0
    public var invokedDidTapIncrementButtonExpectation: XCTestExpectation?

    public func didTapIncrementButton() {
        defer {
            callLogger?.logCall(Self.didTapIncrementButtonCallId)

            invokedDidTapIncrementButtonExpectation?.fulfill()
        }
        invokedDidTapIncrementButton = true
        invokedDidTapIncrementButtonCount += 1
    }

    // MARK: - reset Mock

    public func resetMock(includingStubbedData: Bool = false) {
        invokedTitleGetter = false
        invokedTitleGetterCount = 0
        invokedTitleGetterExpectation = nil
        stubbedTitle = includingStubbedData ? "" : stubbedTitle
        invokedCurrentValueTextGetter = false
        invokedCurrentValueTextGetterCount = 0
        invokedCurrentValueTextGetterExpectation = nil
        stubbedCurrentValueText = includingStubbedData ? "" : stubbedCurrentValueText
        invokedDidTapIncrementButton = false
        invokedDidTapIncrementButtonCount = 0
        invokedDidTapIncrementButtonExpectation = nil
    }

    // swiftlint:enable all
    // sourcery:end

    public init() {}
}
