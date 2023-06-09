//
//  StatsCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 8.6.23.
//

import UIKit

class StatsCell: UICollectionViewCell {

    @IBOutlet weak var statsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ slide: IntroModel) {
        statsImageView.image = slide.image
    }
}
