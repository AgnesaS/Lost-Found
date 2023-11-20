//
//  HomeViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit
import CoreLocation

protocol HomeViewControllerDelegate: AnyObject {
    func didUpdateBookmarkedPosts(_ bookmarkedPosts: [Post])
}

class HomeViewController: UIViewController{
    
    private(set) static var instance: HomeViewController!
    

    //MARK: IBOutles
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var lostAndFoundSegmentControl: UISegmentedControl!
    @IBOutlet var menuTableView: UITableView!
    
    //MARK: Proporties
    let dataService = LocationsDataService()
    var recentPostsViewController: RecentPostsViewController?
    var bookmarkedPosts: [Post] = []
    var postViewController = PostViewController()
    var userData: User?
    var lostItems: [Post] = []
    var foundItems: [Post] = []
    let screen = UIScreen.main.bounds
    var menu = false
    var selectedSegmentIndex = 0
    var home = CGAffineTransform()
    var options: [Option] = []
    var firstSegmentChange: Bool = false
    var newlyFoundPost: Post?
    weak var delegate: HomeViewControllerDelegate? {
        didSet {
            print("HomeViewController - delegate didSet: \(String(describing: delegate))")
        }
    }
    
    override func viewDidLoad() {
        postsCollectionView.isUserInteractionEnabled = true
        super.viewDidLoad()
        HomeViewController.instance = self
        setupTableView()
        setupCollectionView()
        setDetails()
        home = self.containerView.transform
     
        setupSideBar()
        addNotificationObserver()
        //recentPostsViewController.bookmarkedPosts = bookmarkedPosts
    }
    //MARK: Functions
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadListByCategory(notification:)), name: Notification.Name("refreshHome"), object: nil)

    }
    
    @objc func reloadListByCategory(notification: Notification) {
        print("neloadListByCategory userInfo = \(notification.userInfo)")
        if let category = notification.userInfo?["category"] as? String {
            print("neloadListByCategory cat = \(category)")
            if let post = notification.userInfo?["post"] as? Post {
                print("neloadListByCategory  pst = \(post)")
                if category == "Lost" {
                    lostItems.append(post)
                } else {
                    foundItems.append(post)
                }
                print("lostItems count = \(lostItems.count)")
                print("foundItms count = \(foundItems.count)")
                postsCollectionView.reloadData()
            }

        }
    }

    
    func setupTableView(){
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(UINib(nibName: "SideBarCell", bundle: nil), forCellReuseIdentifier: "SideBarCell")
        menuTableView.backgroundColor = .clear
    }
    func setupCollectionView(){
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
    }
    func setupSideBar(){
        options =  [Option(image: UIImage(systemName: "house.fill")!,title: "Home", segue: "Home"),Option(image: UIImage(systemName: "mappin.and.ellipse")!,title: "Location", segue: "Location"),Option(image: UIImage(systemName: "plus.app.fill")!,title: "Add Item", segue: "Post"),Option(image: UIImage(systemName: "bookmark.fill")!,title: "Bookmarked", segue: "Bookmark"),Option(image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle.fill")!,title: "Statistics", segue: "Stats"),Option(image: UIImage(systemName: "arrow.turn.up.forward.iphone.fill")!,title: "About us", segue: "Aboutus"),Option(image: UIImage(systemName: "person.fill")!,title: "Settings", segue: "Profile"),Option(image: UIImage(systemName: "return.right")!,title: "Logout", segue: "Logout")]
    }
    func setLost(){
        
        let item1 = Post(id: 1, image: UIImage(named: "item_lost1")!, title: "Wallet", location: "Royal Mall",date: "10/07/2023",postOwner: "Posted by: Filan Fisteku" ,postDescription: "The lost wallet was a weathered companion, its leather worn and faded, revealing traces of past adventures. Inside, it held a collection of essential cards, faded photographs, and fragments of memories yearning to be found once more.", contactInfo: "filan_fisteku2023@gmail.com")
        let item2 = Post(id: 2, image: UIImage(named: "item_lost2")!, title: "Airpods", location: "Prishtina Mall",date: "05/07/2023",postOwner: "Posted by: Filan Fisteku" ,postDescription: "A pair of AirPods, wireless earbuds in a sleek white case. The AirPods offer seamless connectivity, exceptional sound quality, and are of sentimental value. Generous reward awaits their safe return. If found, please contact", contactInfo: "filan_fisteku2023@gmail.com")
        let item3 = Post(id: 3, image: UIImage(named: "item_lost3")!, title: "Bag", location: "St. Fehmi Agani",date: "23/05/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "A bag of significant importance, inadvertently left behind in the city. The bag holds personal belongings and sentimental items. A heartfelt reward awaits its safe return. If found, kindly contact me.", contactInfo: "filan_fisteku2023@gmail.com")
        let item4 = Post(id: 4, image: UIImage(named: "item_lost4")!, title: "Apple Watch", location: "Bill Clinton Boulevard",date: "16/06/2023",postOwner: "Posted by: Filan Fisteku", postDescription: " An Apple Watch, a sleek and stylish wearable device. It is a silver Apple Watch Series 5 with a black sport band. The watch features a custom engraving on the back, adding a touch of personalization. It holds both functional and sentimental value. A generous reward awaits its safe return.", contactInfo: "filan_fisteku2023@gmail.com")
        let item5 = Post(id: 5, image: UIImage(named: "item_lost5")!, title: "Car Keys", location: "St. Nënë Tereza",date: "01/04/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "A set of car keys belonging to a Honda Civic. They are of great significance for daily mobility. A reward is available for their safe return.", contactInfo: "filan_fisteku2023@gmail.com")
        let item6 = Post(id: 6, image: UIImage(named: "item_lost6")!, title: "Ring", location: "St. Agim Ramadani ",date: "13/04/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "A precious ring of sentimental value. The ring is a gold band adorned with a sparkling diamond. It holds deep personal significance and cherished memories. A heartfelt reward is offered for its safe return. I", contactInfo: "filan_fisteku2023@gmail.com")
        lostItems = [item1, item2, item3, item4, item5, item6]
        postsCollectionView.reloadData()
    }
    func setFound(){
        let item1 = Post(id: 7, image: UIImage(named: "item_found1")!, title: "Iphone 13 Pro", location: "Rruga B",date: "22/10/2023",postOwner: "Posted by: Filan Fisteku", postDescription: " An iPhone 11 Pro, a sleek and powerful smartphone. The phone is  midnight green with 64GB storage]. It holds essential personal information and valuable memories. A generous reward awaits its safe return.", contactInfo: "filan_fisteku2023@gmail.com")
        let item2 = Post(id: 8, image: UIImage(named: "item_found2")!, title: "Wallet", location: "Ulpiane",date: "23/10/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "The lost wallet was a weathered companion, its leather worn and faded, revealing traces of past adventures. Inside, it held a collection of essential cards, faded photographs, and fragments of memories yearning to be found once more.", contactInfo: "filan_fisteku2023@gmail.com")
        let item3 = Post(id: 9, image: UIImage(named: "item_found3")!, title: "Car Keys", location: "Rruga C",date: "22/10/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "A set of car keys belonging to a Honda Civic. They are of great significance for daily mobility. A reward is available for their safe return.", contactInfo: "filan_fisteku2023@gmail.com")
        let item4 = Post(id: 10, image: UIImage(named: "item_found4")!, title: "Glasses", location: "Lakrishte",date: "23/10/2023",postOwner: "Posted by: Filan Fisteku", postDescription: "A pair of glasses, essential for clear vision. The glasses are black rectangular frames with clear lenses. They are prescription glasses and hold great importance for daily activities. A reward is offered for their safe return.", contactInfo: "filan_fisteku2023@gmail.com")
        foundItems = [item1, item2, item3, item4]
        
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
        //if !firstSegmentChange {
//            if selectedSegmentIndex == 0 {
//                // Show lost items
//                setLost()
//            } else {
//                // Show found items
//                setFound()
//                firstSegmentChange = true
//            }
       // }
        
        setLost()
        setFound()

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
        self.postsCollectionView.reloadData()
        selectedSegmentIndex = sender.selectedSegmentIndex
    
        //setDetails()
    }


}
//MARK: TableView -> SideBarCell
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarCell", for: indexPath) as! SideBarCell
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
            self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }
}
//MARK: CollectionView -> PostCell
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedSegmentIndex == 0 {
            print("lost on reload:\(lostItems.count)")
            return lostItems.count
            
        }
        else {
            print("found on reload: \(foundItems.count)")
            return foundItems.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        var post: Post
        if selectedSegmentIndex == 0{
            post = lostItems[indexPath.item]
            cell.foundItemButton.isUserInteractionEnabled = true
            cell.foundItemButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            cell.foundItemButton.tintColor = .tintColor
        }else{
            post = foundItems[indexPath.item]
            cell.foundItemButton.isUserInteractionEnabled = false
            cell.foundItemButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            cell.foundItemButton.tintColor = UIColor(named: "AccentColor")
        }
        cell.indexPath = indexPath
        cell.delegate = self
       
        cell.setup(post)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20 ) / 2
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselect method")
        if collectionView == postsCollectionView {
            var selectedItem: Post
            if selectedSegmentIndex == 0 {
                selectedItem = lostItems[indexPath.item]
            } else {
                selectedItem = foundItems[indexPath.item]
            }
            

            let storyboard = storyboard?.instantiateViewController(withIdentifier: "PostDetailsViewController") as? PostDetailsViewController
            storyboard?.item = selectedItem
            //  storyboard?.modalPresentationStyle = .fullScreen
            storyboard?.modalTransitionStyle = .flipHorizontal
            self.present(storyboard!, animated: true, completion: nil)

        }
    }
}
extension HomeViewController: PostCellDelegate {
    func moveItemFromLostToFound(post: Post, indexPath:IndexPath) {
        if let index = lostItems.firstIndex(where: { $0.id == post.id }) {
            // Remove  item from the lostItems array
            let removedItem = lostItems.remove(at: index)
            print("removed  = \(lostItems.count)")
            // Append the item to the foundItems array

            foundItems.append(removedItem)
            
            print("found  = \(foundItems.count)")
            postsCollectionView.reloadData()
        }
        
    }
    
    func bookmarkPost(post: Post) {
        if let index = lostItems.firstIndex(where: { $0.id == post.id }) {
            lostItems[index].bookMarked = !lostItems[index].bookMarked!

            if lostItems[index].bookMarked! {
                let isAlreadyBookmarked = bookmarkedPosts.contains { $0.id == lostItems[index].id }
                if !isAlreadyBookmarked {
                    bookmarkedPosts.append(lostItems[index])
                    delegate?.didUpdateBookmarkedPosts(bookmarkedPosts)
                }
            } else {
                if let bookmarkIndex = bookmarkedPosts.firstIndex(where: { $0.id == lostItems[index].id }) {
                    bookmarkedPosts.remove(at: bookmarkIndex)
                    delegate?.didUpdateBookmarkedPosts(bookmarkedPosts)
                }
            }
        } else if let index = foundItems.firstIndex(where: { $0.id == post.id }) {
            foundItems[index].bookMarked = !foundItems[index].bookMarked!

            if foundItems[index].bookMarked! {
                let isAlreadyBookmarked = bookmarkedPosts.contains { $0.id == foundItems[index].id }
                if !isAlreadyBookmarked {
                    bookmarkedPosts.append(foundItems[index])
                    delegate?.didUpdateBookmarkedPosts(bookmarkedPosts)
                }
            } else {
                if let bookmarkIndex = bookmarkedPosts.firstIndex(where: { $0.id == foundItems[index].id }) {
                    bookmarkedPosts.remove(at: bookmarkIndex)
                    delegate?.didUpdateBookmarkedPosts(bookmarkedPosts)
                }
            }
        }

        postsCollectionView.reloadData()
        print("bookmarkedPosts: \(bookmarkedPosts)")
    }
}
