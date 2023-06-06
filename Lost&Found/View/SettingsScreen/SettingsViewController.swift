//
//  SettingsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 18.5.23.
//

import UIKit
import Photos
import Firebase

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    
    var imagePicker: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePicker()
    }
    //MARK: Functions
    func setupImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.delegate = self
        PHPhotoLibrary.requestAuthorization { status in
            print("request autherization status: \(status)")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.image = selectedImage
        imagePicker?.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true)
    }
    //MARK: IBActions
    @IBAction func changePhotoButtonPressed(_ sender: Any) {
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            if let imagePic = imagePicker{
                present(imagePic, animated: true)
            }
        }
    }
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("logout")
            let controller = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
              controller.modalPresentationStyle = .fullScreen
             // controller.modalTransitionStyle = .flipHorizontal
            self.present(controller, animated: true, completion: nil)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
