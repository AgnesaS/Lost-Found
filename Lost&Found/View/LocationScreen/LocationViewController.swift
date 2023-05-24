//
//  LocationViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 19.5.23.
//

import UIKit
import SwiftUI


class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func lostItemMapButtonPressed(_ sender: Any) {
        print("tapped")
        let controller = self.storyboard?.instantiateViewController(identifier: "LocationExampleViewController") as! LocationDetailsViewController
          controller.modalPresentationStyle = .fullScreen
         // controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
}
