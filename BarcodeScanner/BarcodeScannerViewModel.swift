import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {

    // MARK - Properties

    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
}
