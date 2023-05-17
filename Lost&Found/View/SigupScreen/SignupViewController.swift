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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    func validateFields(){
        guard let firstName = firstNameTextfield.text, !firstName.isEmpty else{
            self.firstNameTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your First Name".localizableString())
            return
        }
        guard let lastName = lastNameTextfield.text, !lastName.isEmpty else {
            self.lastNameTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your Last Name".localizableString())
            return
        }
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your email address".localizableString())
            return
        }
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else {
            self.phoneNumberTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your email address".localizableString())
            return
        }
        guard let password = passwordTextfield.text, !password.isEmpty else {
            self.passwordTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your password".localizableString())
            return
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.validateFields()
                    self.showAlertWith(title: "Lost & Found", message: "Please enter a valid datas".localizableString())
                } else {
                    let controller = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                      controller.modalPresentationStyle = .fullScreen
                      controller.modalTransitionStyle = .flipHorizontal
                    self.present(controller, animated: true, completion: nil)
                }
            }
            
        }
//        validateFields()
//        if isValidEmail(emailTextField.text ?? ""){
//            let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
//            controller.modalPresentationStyle = .fullScreen
//            controller.modalTransitionStyle = .flipHorizontal
//            present(controller, animated: true, completion: nil)
//        } else{
//            self.showAlertWith(title: "Lost & Found", message: "Please enter a valid email address".localizableString())
//        }
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
