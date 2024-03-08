import SwiftUI

struct BarcodeScannerView: View {

    // MARK: - Private Properties

    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?

    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity,
                           maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode:",
                      systemImage: "barcode.viewfinder")

                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
