//
//  TabBaarViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 19.5.23.
//

import UIKit
import SOTabBar

class TabBaarViewController: SOTabBarController {

    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = .black
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        let historyStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HISTORY_ID")
        let addStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ADD_ID")
        let locationStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LOCATION_ID")
        let meStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController")
        
        homeStoryboard.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home2"), selectedImage: UIImage(named: "home_Selected"))
        historyStoryboard.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "history2"), selectedImage: UIImage(named: "history_Selected"))
        addStoryboard.tabBarItem = UITabBarItem(title: "Add", image: UIImage(named: "plus2"), selectedImage: UIImage(named: "plus_Selected"))
        locationStoryboard.tabBarItem = UITabBarItem(title: "Location", image: UIImage(named: "location2"), selectedImage: UIImage(named: "location_Selected"))
        meStoryboard.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "man2"), selectedImage: UIImage(named: "menu_Selected"))
           
        viewControllers = [homeStoryboard, historyStoryboard,addStoryboard,locationStoryboard,meStoryboard]
    }
    
}

extension TabBaarViewController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}


