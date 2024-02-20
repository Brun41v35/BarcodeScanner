//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Bruno Silva on 18/02/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode: String

    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }

    final class Coordinator: NSObject, ScannerDelegate {

        private var scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }

        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

#Preview {
    ScannerView(scannedCode: .constant("123456"))
}
