//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Bruno Silva on 18/02/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    final class Coordinator: NSObject, ScannerDelegate {

        func didFind(barcode: String) {
            print(barcode)
        }

        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

#Preview {
    ScannerView()
}
