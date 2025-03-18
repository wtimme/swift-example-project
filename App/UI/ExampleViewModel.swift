import SwiftUI
import Framework

// MARK: - ViewModel

extension Example {
    protocol ViewModelProtocol {
        var title: String { get }
        var currentValueText: String { get }
        
        func didTapIncrementButton()
    }
    
    @Observable class ViewModel: ViewModelProtocol {
        var title: String = L10n.welcomeTitle
        var currentValueText: String {
            NumberFormatter().string(for: currentValue) ?? "---"
        }
        
        private let incrementor: Incrementing
        private var currentValue: Int
        
        init (
            incrementor: Incrementing = Incrementor(),
            currentValue: Int = 0
        ) {
            self.incrementor = incrementor
            self.currentValue = currentValue
        }
        
        func didTapIncrementButton() {
            currentValue = incrementor.increment(numberToIncrement: currentValue)
        }
    }
}
