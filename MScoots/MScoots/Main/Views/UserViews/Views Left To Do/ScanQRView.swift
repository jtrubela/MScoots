//
//  ScanQRView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/15/23.
//

import SwiftUI
import CodeScanner

struct ScanQRView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started"
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    if case let .success(code) = result {
                        self.scannedCode = code.string
                        self.isPresentingScanner = false
                    }
                }
            })
    }
    
    
    
    var body: some View {
        VStack(spacing: 10){
            Text(scannedCode)
            
            Button("Scan QR Code"){
                self.isPresentingScanner = true
            }.sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}
struct ScanQRView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRView()
    }
}
