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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.text = "agi@gmail.com"
        passwordTextField.text = "123456"
        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    
    func validateFields(){
        guard let email = emailTextfield.text, !email.isEmpty else {
            self.emailTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Found & Lost", message: "Please enter your email".localizableString())
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            self.passwordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your password".localizableString())
            return
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func verifyemail(){
        guard let email = emailTextfield.text else { return }
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            
            if let error = error {
                self.showAlertWith(title: "Error", message: "Your email address isn't verified.")
            }
            self.showOKAlertWith(title: "Verification Email Sent", message: "A verification email has been sent to \(email). Please check your email and follow the instructions to verify your account.", screen: "home")
        })
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextfield.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print("Error\(e)")
                    self?.validateFields()
                    self?.showAlertWith(title: "Lost & Found", message: "Please enter valid datas".localizableString())
                } else {
                    
                  //  self?.verifyemail()
                    let controller = self?.storyboard?.instantiateViewController(identifier: "TabBaarViewController") as! TabBaarViewController
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .flipHorizontal
                    self?.present(controller, animated: true, completion: nil)
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
