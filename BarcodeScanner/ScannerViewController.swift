import UIKit
import AVFoundation

protocol ScannerDelegate: AnyObject {
    func didFind(barcode: String)
}

final class ScannerViewController: UIViewController {

    // MARK: - Properties

    private let captureSession = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerDelegate?

    // MARK: - Init

    init(scannerDelegate: ScannerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            // TODO: Handle with Error
            return
        }

        let videoInput: AVCaptureDeviceInput

        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            // TODO: Handle with Error
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            // TODO: Handle with error
            return
        }

        let metaDataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self,
                                                      queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return
        }
    }
}

// MARK: - Extension

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {}
