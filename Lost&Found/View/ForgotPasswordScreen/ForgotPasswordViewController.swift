//
//  ForgotPasswordViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!

    var viewModel: ForgotPasswordViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
   viewModel = ForgotPasswordViewModel()
    }
    
    //MARK: Functions
    func validateFields() -> Bool{
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your email".localizableString())
            return false
        }
        return true
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        if  validateFields(){
            if let email = emailTextField.text{
                viewModel.resetPassword(email: email){ [weak self] success, error in
                    if let error = error {
                        self?.showAlertWith(title: "Error", message: "There is no user record corresponding to this identifier. Please check if your email is correct".localizableString())
                    }else {
                        self?.showOKAlertWith(title: "Lost & Found", message: "A password reset email has been send to this address!".localizableString(), screen: "login")
                    }
                    
                }
            }
        }
        
            
        }
}
