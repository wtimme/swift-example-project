@testable import App
import SnapshotTesting
import XCTest

final class ExampleSnapshotTests: XCTestCase {
    var mockViewModel: MockExampleViewModel!
    var sut: Example!

    override func setUp() {
        mockViewModel = .init()
        
        mockViewModel.stubbedTitle = "Title goes here"
        mockViewModel.stubbedCurrentValueText = "55"

        sut = .init(viewModel: mockViewModel)
    }

    func test_view() {
        // Given
        // Intentionally left empty.

        // When
        // Intentionally left empty.

        // Then
        assertSnapshot(of: sut,
                       as: .image(layout: .device(config: .iPad10_2(.landscape))))
    }
}
