import SwiftUI

struct Example: View {
    private enum Constants {
        static let verticalSpacing: CGFloat = 12
    }

    @State private var viewModel: ViewModelProtocol

    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: Constants.verticalSpacing) {
            Spacer()
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.currentValueText)
            Button.init(action: viewModel.didTapIncrementButton) {
                Text("Increment")
            }
            Spacer()
        }
    }
}
