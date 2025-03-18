@testable import Framework
import XCTest

final class IncrementorTests: XCTestCase {
    private var sut: Incrementing!

    override func setUp() {
        sut = Incrementor()
    }

    func test_increment_when_invoked_then_shouldIncrementGivenNumberByOne() throws {
        // Given
        let number = 42

        // When
        let actual = sut.increment(numberToIncrement: number)

        // Then
        XCTAssertEqual(actual, number + 1)
    }
}
