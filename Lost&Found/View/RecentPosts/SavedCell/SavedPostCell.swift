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
    
    weak var delegate: PostCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: Functions
    func configure(with post: Post){
        postImageView.image = post.image
        postTitleLabel.text = post.title
        locationPostLabel.text = post.location
        postDescriptionLabel.text = post.postDescription
        postDateLabel.text = post.date
    }
}
