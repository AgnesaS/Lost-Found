//
//  ChangeFirstLastNameViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 8.6.23.
//

import UIKit
protocol ChangeFirstLastNameDelegate: AnyObject {
    func didUpdateFirstName(_ firstName: String)
    func didUpdateLastName(_ lastName: String)
}

class ChangeFirstLastNameViewController: UIViewController {
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    weak var delegate: ChangeFirstLastNameDelegate?
    var firstName: String = ""
    var lastName: String = ""
    var settingsViewController: SettingsViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func validateFields() -> Bool{
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else{
            self.firstNameTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your First Name".localizableString())
            return false
        }
        guard let lastName = lastNameTextField.text, !lastName.isEmpty else {
            self.lastNameTextField.becomeFirstResponder()
            self.showAlertWith(title: "Lost & Found", message: "Please enter your Last Name".localizableString())
            return false
        }
        return true
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save button pressed")
        if validateFields() {
            let firstName = firstNameTextField.text ?? ""
            let lastName = lastNameTextField.text ?? ""
            delegate?.didUpdateFirstName(firstName)
            delegate?.didUpdateLastName(lastName)
            dismiss(animated: true, completion: nil)
        }
    }
}
