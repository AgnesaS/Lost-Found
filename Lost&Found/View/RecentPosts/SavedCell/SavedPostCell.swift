//
//  SavedPostCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 6.6.23.
//

import UIKit



class SavedPostCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var locationPostLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var savedButton: UIButton!
    @IBOutlet weak var foundButton: UIButton!
    
   // weak var delegate: PostCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: Functions
    func configure(with post: Post){
        postImageView.image = post.image
        postTitleLabel.text = post.title
        locationPostLabel.text = post.location
        postDescriptionLabel.text = post.location
        locationPostLabel.text =  post.postOwner
        
        postDateLabel.text = post.date
        savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        savedButton.tintColor = .tintColor
        foundButton.isHidden = true
    }
    @IBAction func savedButtonPressed(_ sender: Any) {
        
    }
}
