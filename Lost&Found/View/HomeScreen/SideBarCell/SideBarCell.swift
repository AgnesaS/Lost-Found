//
//  SideBarCell.swift
//  Lost&Found
//
//  Created by Agnesa  on 31.5.23.
//

import UIKit

class SideBarCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
