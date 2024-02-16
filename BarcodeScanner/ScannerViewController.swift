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
}
