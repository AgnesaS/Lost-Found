//
//  PostCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    func bookmarkPost(_ post: Post)
}
class PostCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
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
    }
    @IBAction func bookmarkPost(_ sender: Any) {
        print("Pressed")
        if let post = post {
            delegate?.bookmarkPost(post)
        }
        if bookmarkButton.tintColor == .blue {
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            bookmarkButton.tintColor = .label
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            bookmarkButton.tintColor = .blue
        }
    }
}
