//
//  PostDetailsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 8.6.23.
//

import UIKit

class PostDetailsViewController: UIViewController {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: Post?
    override func viewDidLoad() {
     
        super.viewDidLoad()
        postImageView.image = item?.image
        titleLabel.text = item?.title
        descriptionLabel.text = item?.postDescription
        locationLabel.text = item?.location
        dateAndTimeLabel.text = item?.date
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
