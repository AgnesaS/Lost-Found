//
//  SlideCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit

class SlideCell: UICollectionViewCell {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    static let identifier = String(describing: SlideCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setup(_ slide: IntroModel) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
