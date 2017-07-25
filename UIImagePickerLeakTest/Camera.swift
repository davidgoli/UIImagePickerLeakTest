import UIKit
import MobileCoreServices

protocol Camera {
    func takePictures(from viewController: UIViewController)
}

class CameraReal: NSObject, Camera, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var viewController: UIViewController!

    func takePictures(from viewController: UIViewController) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }

        let imagePicker = createImagePicker()

        viewController.present(imagePicker, animated: true, completion: nil)
    }

    // MARK: - Private

    func createImagePicker() -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        imagePicker.showsCameraControls = true
        return imagePicker
    }
}
