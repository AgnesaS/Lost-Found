//
//  PostCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    func addLostItemToFound(at indexPath: IndexPath)
    func collectionViewIndexPath(for cell: UICollectionViewCell) -> IndexPath?
}
//protocol PostCellDelegate: AnyObject {
//    func bookmarkPost(_ post: Post)
//}
class PostCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var foundItemButton: UIButton!
    //MARK: - Proporties
    weak var delegate: PostCellDelegate?
    private var post: Post?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: Functions
    func setup(_ post: Post){
        self.post = post
        postImageView.image = post.image
        postTitleLabel.text = post.title
        locationLabel.text = post.location
        descriptionLabel.text = post.postDescription
        dateLabel.text = post.date
        
        toggleCheckmarkState()
    }
    @IBAction func bookmarkPost(_ sender: Any) {
        print("Pressed bookmark")
        if let post = post {
       //     delegate?.bookmarkPost(post)
        }
        toggleBookmarkState()
    }
    private func toggleBookmarkState() {
        if bookmarkButton.tintColor == .blue {
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            bookmarkButton.tintColor = .label
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            bookmarkButton.tintColor = UIColor(named: "AccentColor")
        }
    }
    @IBAction func foundItemButtonPressed(_ sender: Any) {
        
        print("presseed checkmark")
        
        guard var post = post else { return }
           post.isItemFound.toggle()
           toggleCheckmarkState()
        
        if let indexPath = delegate?.collectionViewIndexPath(for: self) {
                delegate?.addLostItemToFound(at: indexPath)
            }
            toggleCheckmarkState()
    }
    private func toggleCheckmarkState() {
        guard let post = post else { return }
          
        if post.isItemFound {
              foundItemButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
              foundItemButton.tintColor = UIColor(named: "AccentColor")
            //foundItemButton.isUserInteractionEnabled = false
          } else {
              foundItemButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
              foundItemButton.tintColor = .tintColor
          }
    }
    
}

