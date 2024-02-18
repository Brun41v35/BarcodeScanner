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
                ScannerView()
                    .frame(maxWidth: .infinity,
                           maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode:",
                      systemImage: "barcode.viewfinder")

                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
