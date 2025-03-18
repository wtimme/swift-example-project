import Framework
import FrameworkTestHelpers
@testable import App
import TestHelpers
import XCTest

final class ExampleViewModelTests: XCTestCase {
    var mockIncrementor: MockIncrementor!
    var sut: Example.ViewModelProtocol!

    override func setUp() {
        mockIncrementor = .init()
        
        sut = Example.ViewModel(incrementor: mockIncrementor)
    }

    func test_title_shouldBeWelcomeTitle() {
        // Given
        // Intentionally left empty.

        // When
        let actual = sut.title

        // Then
        XCTAssertEqual(actual, L10n.welcomeTitle)
    }
    
    func test_didTapIncrementButton_when_invoked_then_shouldInvokeIncrementorIncrement() {
        // Given
        // Intentionally left empty.
        
        // When
        sut.didTapIncrementButton()
        
        // Then
        XCTAssertTrue(mockIncrementor.invokedIncrement)
    }
    
    func test_didTapIncrementButton_when_invoked_then_shouldInvokeIncrementorIncrementWithCurrentValue() {
        // Given
        let currentValue = 23
        sut = Example.ViewModel(incrementor: mockIncrementor, currentValue: currentValue)
        
        // When
        sut.didTapIncrementButton()
        
        // Then
        XCTAssertEqual(mockIncrementor.invokedIncrementParameters?.numberToIncrement, currentValue)
    }
}
