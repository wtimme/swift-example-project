import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            Example(viewModel: Example.ViewModel())
        }
    }
}
