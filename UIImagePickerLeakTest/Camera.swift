import UIKit
import MobileCoreServices

protocol Camera {
    func takePictures(from viewController: UIViewController)
}

class CameraReal: NSObject, Camera, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var overlayView: UIView!
    @IBOutlet weak var imagesCount: UILabel!

    weak var viewController: UIViewController!
    var imagePicker: UIImagePickerController!
    var pictureTaken: ((UIImage) -> Bool)!

    func takePictures(from viewController: UIViewController) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }

        self.viewController = viewController

        createImagePicker()
        setupOverlay()

        viewController.present(imagePicker!, animated: true, completion: nil)
    }

    // MARK: - IBActions

    @IBAction func doneTapped(_ sender: Any) {
        viewController?.dismiss(animated: true)
    }

    @IBAction func captureTapped(_ sender: Any) {
        self.imagePicker?.takePicture()
    }

    // MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    }

    // MARK: - Private

    func createImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        imagePicker.showsCameraControls = false
        self.imagePicker = imagePicker
    }

    func setupOverlay() {
        Bundle.main.loadNibNamed("CameraOverlay", owner: self, options: nil)
        overlayView.frame = imagePicker!.cameraOverlayView!.frame
        imagePicker!.cameraOverlayView = overlayView
        overlayView = nil
    }
}
