//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Bruno Silva on 04/02/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {

        NavigationView {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity,
                           maxHeight: 300)
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
