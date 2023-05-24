//
//  SignupViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var viewModel: SignupViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SignupViewModel()
        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    func validateFields() -> Bool {
        guard let firstName = firstNameTextfield.text, !firstName.isEmpty else{
            self.firstNameTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your First Name".localizableString())
            return false
        }
        
        guard let lastName = lastNameTextfield.text, !lastName.isEmpty else {
            self.lastNameTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your Last Name".localizableString())
            return false
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your email address".localizableString())
            return false
        }
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else {
            self.phoneNumberTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your email address".localizableString())
            return false
        }
        guard let password = passwordTextfield.text, !password.isEmpty else {
            self.passwordTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your password".localizableString())
            return false
        }
        return true
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextfield.text, let firstName = firstNameTextfield.text, let lastName = lastNameTextfield.text, let number = phoneNumberTextField.text{
            if validateFields(){
                viewModel.signUp(firstName: firstName, lastName: lastName, email: email, phoneNumber: number, password: password) { [weak self] error in
                    if let error = error{
                        self?.showAlertWith(title: "Lost & Found", message: "Please enter valid data".localizableString())
                    }else {
                        let controller = self?.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                          controller.modalPresentationStyle = .fullScreen
                          controller.modalTransitionStyle = .flipHorizontal
                        self?.present(controller, animated: true, completion: nil)
                    }
                }
            }
            
        }
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }


}
