import SwiftUI

struct BarcodeScannerView: View {

    // MARK: - Private Properties

    @StateObject var viewModel = BarcodeScannerViewModel()

    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode)
                    .frame(maxWidth: .infinity,
                           maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode:",
                      systemImage: "barcode.viewfinder")

                Text(viewModel.scannedCode.isEmpty ? "Not Yet Scanned" : viewModel.scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
