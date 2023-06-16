//
//  SettingsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 18.5.23.
//

import UIKit
import Photos
import Firebase
import SafariServices

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ChangeFirstLastNameDelegate {
    func didUpdateFirstName(_ firstName: String) {
        firstNameLabel.text = firstName
    }
    
    func didUpdateLastName(_ lastName: String) {
        lastNameLabel.text = lastName
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var turnOnOffNotificationsSwitch: UISwitch!
    
    var forgotPasswordViewController: ForgotPasswordViewController?

    var imagePicker: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
      //  turnOnOffNotificationsSwitch.addTarget(self, action: #selector(turnOnOffNotificationsChanged(_:)), for: .valueChanged)
        setupImagePicker()
  
    }
    @objc private func turnOnOffNotificationsChanged(_ sender: UISwitch) {
        if sender.isOn {
            // User turned on notifications, request authorization
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                if let error = error {
                    print("Error requesting notification authorization: \(error)")
                } else if granted {
                    print("Notification authorization granted")
                } else {
                    print("Notification authorization denied")
                }
            }
        } else {
            // User turned off notifications, remove any pending notifications
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
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
    @IBAction func changeFirstLastNameButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "ChangeFirstLastNameViewController") as! ChangeFirstLastNameViewController
        controller.modalPresentationStyle = .fullScreen
        controller.delegate = self
        // controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func changePasswordButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        forgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        // Change the titleLabel text
        forgotPasswordViewController?.customTitle = "Change Password"
        
        forgotPasswordViewController?.modalPresentationStyle = .fullScreen
        if let forgotPasswordVC = forgotPasswordViewController {
            present(forgotPasswordVC, animated: true, completion: nil)
        }
    }
    @IBAction func goToPrivacyPolicyLink(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string:"https://www.smooth-on.com/page/privacy-policy/?pk_campaign=dynamicsearch&pk_kwd=&gclid=CjwKCAjwjMiiBhA4EiwAZe6jQzxXzebtYuU3Fys66YEXyJo6mUhYZPDLn7UI9iPTxAfNxp0nn-bRZRoCtgYQAvD_BwE")!)
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func aboutUsButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "AboutUsViewController") as! AboutUsViewController


        self.present(controller, animated: true, completion: nil)
    }
    

    
    @IBAction func statisticsButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: "StatisticsViewController") as!StatisticsViewController


        self.present(controller, animated: true, completion: nil)
        
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
