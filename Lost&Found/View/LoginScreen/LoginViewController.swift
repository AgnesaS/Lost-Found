//
//  LoginViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.text = "agi@gmail.com"
        passwordTextField.text = "123456"
        // Do any additional setup after loading the view.
        viewModel = LoginViewModel()
    }
    //MARK: Functions
    
    func validateFields() -> Bool {
            guard let email = emailTextfield.text, !email.isEmpty else {
                emailTextfield.becomeFirstResponder()
                showAlertWith(title: "Found & Lost", message: "Please enter your email".localizableString())
                return false
            }
            
            guard let password = passwordTextField.text, !password.isEmpty else {
                passwordTextField.becomeFirstResponder()
                showAlertWith(title: "Discover the World", message: "Please enter your password".localizableString())
                return false
            }
            
            return true
        }
    func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextfield.text, let password = passwordTextField.text {
                    if validateFields() {
                        viewModel.signIn(email: email, password: password) { [weak self] error in
                            if let error = error {
                                print("Error: \(error)")
                                self?.showAlertWith(title: "Lost & Found", message: "Please enter valid data".localizableString())
                            } else {
                                self?.viewModel.sendVerificationEmail(email: email) { [weak self] error in
                                    if let error = error{
                                        self?.showAlertWith(title: "Error", message: "Your email address isn't verified.")
                                    }
                                    self?.showOKAlertWith(title: "Verification Email Sent", message: "A verification email has been sent to \(email). Please check your email and follow the instructions to verify your account.", screen: "home")
                                }
                            }
                        }
                    }
                }
    }
    @IBAction func signupButtonTapped(_ sender: Any) {
        print("tapped")
        let controller = storyboard?.instantiateViewController(identifier: "SignupViewController") as! SignupViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        print("tapped")
        let controller = storyboard?.instantiateViewController(identifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
}
