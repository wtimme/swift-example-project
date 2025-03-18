@testable import App
import ViewInspector
import XCTest

final class ExampleTests: XCTestCase {
    var mockViewModel: MockExampleViewModel!

    var sut: Example!

    override func setUp() {
        mockViewModel = .init()

        sut = .init(viewModel: mockViewModel)
    }

    func test_view_when_rendered_then_shouldContainTitleLabel(
    ) {
        // Given
        let title = "Example"
        mockViewModel.stubbedTitle = title
        
        // When
        let actual = try? sut.inspect().find(text: title)

        // Then
        XCTAssertNotNil(actual)
    }
}
