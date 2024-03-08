import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {

    // MARK - Properties

    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?

    var staticText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }

    var statusColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
