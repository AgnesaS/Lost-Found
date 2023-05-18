//
//  SettingsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 18.5.23.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
