//
//  PostCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import UIKit
import UserNotifications

protocol PostCellDelegate: AnyObject {
    func bookmarkPost(post: Post)
    func  moveItemFromLostToFound(post: Post, indexPath: IndexPath)
}
class PostCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var postOwner: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var foundItemButton: UIButton!
    //MARK: - Proporties
    weak var delegate: PostCellDelegate?
    private var post: Post?
    var indexPath: IndexPath?
    private var isBookmarked = false
    private var isFoundItem = false
    
    
    override func awakeFromNib() {
        setupNotifications()
        super.awakeFromNib()
    }
    //MARK: Functions
    func setupNotifications(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error)")
            } else if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
    }
    func setup(_ post: Post){
        self.post = post
        self.post = post
        postImageView.image = post.image
        postTitleLabel.text = post.title
        locationLabel.text = post.location
        postOwner.text = post.postOwner
      
        bookmarkButton.setImage(UIImage(systemName: post.bookMarked ?? false ? "bookmark.fill" : "bookmark"), for: .normal)
        

        
       
    }
    private func toggleBookmarkState() {
        isBookmarked.toggle()
        if isBookmarked{
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            bookmarkButton.tintColor = UIColor(named: "AccentColor")
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            bookmarkButton.tintColor = .label
        }
    }

    private func displayItemFoundNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Item Found"
        content.body = "Your item has been found"
        content.badge = 1
        content.sound = .default

        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "ItemFoundNotification", content: content, trigger: trigger)
        

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error sending notification: \(error)")
            } else {
                print("Notification sent successfully")
            }
        }

    }
    //MARK: IBActions
    @IBAction func bookmarkPost(_ sender: Any) {
        print("Pressed bookmark")
        if let post = post {
            delegate?.bookmarkPost(post: post)
        }
        toggleBookmarkState()
    }
    @IBAction func foundItemButtonPressed(_ sender: Any) {
        if let post = post{
            delegate?.moveItemFromLostToFound(post: post, indexPath: self.indexPath!)
        }
        if !(post?.isItemFound! ?? true){
            displayItemFoundNotification()
        }
    }
}

