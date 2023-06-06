//
//  HomeViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: IBOutles
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var lostAndFoundSegmentControl: UISegmentedControl!
    @IBOutlet var menuTableView: UITableView!
    
    var postViewController = PostViewController()
    var userData: User?
    var lostItems: [Post] = []
    var foundItems: [Post] = []
    let screen = UIScreen.main.bounds
    var menu = false
    var selectedSegmentIndex = 0
    var home = CGAffineTransform()
    var options: [option] = [option(image: UIImage(systemName: "person.fill")!,title: "Profile", segue: "Profile"),option(image: UIImage(systemName: "house.fill")!,title: "Home", segue: "Home"),option(image: UIImage(systemName: "list.bullet")!,title: "Home", segue: "Home"),option(image: UIImage(systemName: "return.right")!,title: "Logout", segue: "Logout")]
    
    struct option {
        var image = UIImage()
        var title = String()
        var segue = String()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(UINib(nibName: "SideBarCell", bundle: nil), forCellReuseIdentifier: "SideBarCell")
        menuTableView.backgroundColor = .clear
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
        home = self.containerView.transform
        postViewController.delegate = self
        setDetails()
    }
    func setLost(){
        lostItems = [Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),
                     Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "baked potato")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda")]
        postsCollectionView.reloadData()
    }
    func setFound(){
        foundItems = [Post(image: UIImage(named: "keys")!, title: "Found", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),
                      Post(image: UIImage(named: "keys")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "keys")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "keys")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda"),Post(image: UIImage(named: "keys")!, title: "Wallet", location: "Prishtina",date: "22/10/2023", postDescription: "sdhahaskhda")]
        postsCollectionView.reloadData()
    }
    //MARK: Functions
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
    func setDetails() {
        if selectedSegmentIndex == 0 {
            // Show lost items
            setLost()
        } else {
            // Show found items
            setFound()
        }
        postsCollectionView.reloadData()
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
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
        setDetails()
    }
    //    @IBAction func showProfile(_ sender: Any) {
    //        print("tapped")
    //        let controller = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
    //        controller.userData = userData // Pass the user data
    //        controller.modalPresentationStyle = .fullScreen
    //        controller.modalTransitionStyle = .flipHorizontal
    //        present(controller, animated: true, completion: nil)
    //    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarCell", for: indexPath) as! SideBarCell
        cell.descriptionLabel.text = options[indexPath.row].title
        cell.descriptionLabel.textColor = .white
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
            self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedSegmentIndex == 0 {
            return lostItems.count
        }
        else {
            return foundItems.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        var post: Post
        if selectedSegmentIndex == 0{
            post = lostItems[indexPath.item]
        }else{
            post = foundItems[indexPath.item]
        }
        cell.setup(post)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20 ) / 2
        return CGSize(width: size, height: size)
    }
}
extension HomeViewController: PostViewControllerDelegate {
    func didCreatePost(_ post: Post, category: String) {
        if category == "Lost" {
            lostItems.append(post)
        } else if category == "Found" {
            foundItems.append(post)
        }
        postsCollectionView.reloadData()
    }
}
