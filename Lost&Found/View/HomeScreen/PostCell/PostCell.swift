//
//  PostCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import UIKit

class PostCell: UICollectionViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ post: Post){
        postImageView.image = post.image
        postTitleLabel.text = post.title
        locationLabel.text = post.location
        descriptionLabel.text = post.postDescription
        dateLabel.text = post.date
    }

}
