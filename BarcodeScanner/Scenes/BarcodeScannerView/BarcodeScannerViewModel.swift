import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {

    // MARK - Properties

    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?

    var staticText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }

    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
