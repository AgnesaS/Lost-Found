//
//  ForgotPasswordViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    func validateFields(){
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your email".localizableString())
            return
        }
        guard let oldPasswordd = oldPasswordTextField.text, !oldPasswordd.isEmpty else {
            self.oldPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your old password".localizableString())
            return
    }
        guard let newPassword = newPasswordTextField.text, !newPassword.isEmpty else {
            self.newPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your new password".localizableString())
            return
    }
        guard (oldPasswordd == newPassword) else {
            self.showAlertWith(title: "Lost & Found", message: "Passwords doesn't match".localizableString())
            return
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        validateFields()
        if isValidEmail(emailTextField.text ?? ""){
            let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else{
            self.showAlertWith(title: "Lost & Found", message: "Please enter a valid email address".localizableString())
        }
        
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
