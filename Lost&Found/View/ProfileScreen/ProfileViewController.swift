//
//  ProfileViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 25.5.23.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userData: User?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = userData {
              // Set the labels with the user data
              firstNameLabel.text = user.firstName
              lastName.text = user.lastName
              phoneNumberLabel.text = user.phoneNumber
              emailLabel.text = user.email
          }
    }
    

}
