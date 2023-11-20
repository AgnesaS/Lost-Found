//
//  PostDetailsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 8.6.23.
//

import UIKit

class PostDetailsViewController: UIViewController {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postOwnerLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    var item: Post?
    override func viewDidLoad() {
     
        super.viewDidLoad()
        postImageView.image = item?.image
        titleLabel.text = item?.title
        postOwnerLabel.text = item?.postOwner ?? ""
        descriptionLabel.text = "Description:\(String(describing: item?.postDescription ?? ""))"
        locationLabel.text = "Location:\(String(describing: item?.location ?? ""))"
        dateAndTimeLabel.text = "Date:\(String(describing: item?.date ?? ""))"
        contactLabel.text = "Contact : \(String(describing: item?.contactInfo ?? ""))"
    //    dateAndTimeLabel.text = item?.imageNames
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
