//
//  HomeViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit

import UIKit

class HomeViewController: UIViewController {
    //MARK: IBOutles
    @IBOutlet var containerView: UIView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var menuTableView: UITableView!
    
    let screen = UIScreen.main.bounds
    var menu = false
    var home = CGAffineTransform()
    var options: [option] = [option(image: UIImage(systemName: "house.fill")!,title: "Home", storyboard: "HomeViewController"),option(image: UIImage(systemName: "person.fill")!,title: "Settings", storyboard: "SettingsViewController")]
    struct option {
        var image = UIImage()
        var title = String()
        var storyboard = String()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        home = self.containerView.transform
    }
    //MARK: IBFunctions
    func showMenu() {
        self.containerView.layer.cornerRadius = 40
      //  self.viewBG.layer.cornerRadius = self.containerView.layer.cornerRadius
        let x = screen.width * 0.8
        let originalTransform = self.containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7, animations: {
            self.containerView.transform = scaledAndTranslatedTransform
        })
    }
    func hideMenu() {
        UIView.animate(withDuration: 0.7, animations: {
                  self.containerView.transform = self.home
                  self.containerView.layer.cornerRadius = 0
                  //self.viewBG.layer.cornerRadius = 0
        })
    }
    //MARK: IBActions
    @IBAction func showMenu(_ sender: UISwipeGestureRecognizer) {
        print("clicked")
        if menu == false && swipeGesture.direction == .right {
            print("user is showing menu")
            showMenu()
            menu = true
        }
    }
    @IBAction func hideMenu(_ sender: Any) {
        if menu == true {
            print("user is hiding menu")
            hideMenu()
            menu = false
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        cell.descriptionLabel.text = options[indexPath.row].title
        cell.descriptionLabel.textColor = .black
        cell.iconImageView.image = options[indexPath.row].image

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
            currentCell.alpha = 0.5
            UIView.animate(withDuration: 1, animations: {
                currentCell.alpha = 1
            })
            
            //             self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }
}
class tableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
}
