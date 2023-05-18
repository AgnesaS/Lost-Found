//
//  TabBarViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 18.5.23.
//

import UIKit
import SOTabBar

class TabBarViewController: SOTabBarController {

    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = .black
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HOME_ID")
        let chatStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CHAT_ID")
        let sleepStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SLEEP_ID")
        let musicStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MUSIC_ID")
        let meStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ME_ID")
        
        homeStoryboard.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home2"), selectedImage: UIImage(named: "home_Selected"))
        chatStoryboard.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "history2"), selectedImage: UIImage(named: "history_Selected"))
        sleepStoryboard.tabBarItem = UITabBarItem(title: "Sleep", image: UIImage(named: "plus2"), selectedImage: UIImage(named: "plus_Selected"))
        musicStoryboard.tabBarItem = UITabBarItem(title: "Music", image: UIImage(named: "location2"), selectedImage: UIImage(named: "location_Selected"))
        meStoryboard.tabBarItem = UITabBarItem(title: "Me", image: UIImage(named: "man2"), selectedImage: UIImage(named: "menu_Selected"))
           
        viewControllers = [homeStoryboard, chatStoryboard,sleepStoryboard,musicStoryboard,meStoryboard]
    }
    
}

extension ViewController: SOTabBarControllerDelegate {
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
}


