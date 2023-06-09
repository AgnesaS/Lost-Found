//
//  RecentPostsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 6.6.23.
//

import UIKit

class RecentPostsViewController: UIViewController{
//    func bookmarkPost(_ post: Post) {
//        bookmarkedPosts.append(post)
//        if savedAndPostedSegmentedControl.selectedSegmentIndex == 0 {
//                   recentsPostCollectionView.reloadData()
//               }
 //   }
    //MARK: IBOutlets
    @IBOutlet weak var recentsPostCollectionView: UICollectionView!
    @IBOutlet weak var savedAndPostedSegmentedControl: UISegmentedControl!
    //MARK: Proporties
    var bookmarkedPosts: [Post] = []
    var justPostedPosts: [Post] = []
    var selectedSegmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setDetails()
    }
    func setupCollectionView(){
        recentsPostCollectionView.delegate = self
        recentsPostCollectionView.dataSource = self
        recentsPostCollectionView.register(UINib(nibName: "SavedPostCell", bundle: nil), forCellWithReuseIdentifier: "SavedPostCell")
       
        recentsPostCollectionView.reloadData()
    }
    func setDetails() {
             // Remove any existing container view
             if let containerView = view.viewWithTag(100) {
                 containerView.removeFromSuperview()
             }
             if selectedSegmentIndex == 0 {
                 if bookmarkedPosts.isEmpty {
                     let imageView = UIImageView(image: UIImage(named: "emptyy"))
                     imageView.contentMode = .scaleAspectFit
                     imageView.translatesAutoresizingMaskIntoConstraints = false
                     NSLayoutConstraint.activate([
                         imageView.widthAnchor.constraint(equalToConstant: 200),
                         imageView.heightAnchor.constraint(equalToConstant: 200)
                     ])

                     let titleLabel = UILabel()
                     titleLabel.text = "No saved posts"
                     titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

                     let descriptionLabel = UILabel()
                     descriptionLabel.text = "Here are shown posts that you save."
                     descriptionLabel.numberOfLines = 0

                     let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, descriptionLabel])
                     stackView.axis = .vertical
                     stackView.alignment = .center
                     stackView.spacing = 10

                     let containerView = UIView()
                     containerView.addSubview(stackView)
                     stackView.translatesAutoresizingMaskIntoConstraints = false

                     NSLayoutConstraint.activate([
                         stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                         stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                     ])

                     containerView.tag = 100 // Set a unique tag to identify the container view
                     view.addSubview(containerView)
                     containerView.translatesAutoresizingMaskIntoConstraints = false

                     NSLayoutConstraint.activate([
                         containerView.topAnchor.constraint(equalTo: recentsPostCollectionView.topAnchor),
                         containerView.leadingAnchor.constraint(equalTo: recentsPostCollectionView.leadingAnchor),
                         containerView.trailingAnchor.constraint(equalTo: recentsPostCollectionView.trailingAnchor),
                         containerView.bottomAnchor.constraint(equalTo: recentsPostCollectionView.bottomAnchor)
                     ])
                 }
             } else {
                 if justPostedPosts.isEmpty {
                     let imageView = UIImageView(image: UIImage(named: "emptyBox"))
                     imageView.contentMode = .scaleAspectFit
                     imageView.translatesAutoresizingMaskIntoConstraints = false
                     NSLayoutConstraint.activate([
                         imageView.widthAnchor.constraint(equalToConstant: 200),
                         imageView.heightAnchor.constraint(equalToConstant: 200)
                     ])

                     let titleLabel = UILabel()
                     titleLabel.text = "You have not posted anything"
                     titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

                     let descriptionLabel = UILabel()
                     descriptionLabel.text = "Here are shown your just posted posts"
                     descriptionLabel.numberOfLines = 0

                     let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, descriptionLabel])
                     stackView.axis = .vertical
                     stackView.alignment = .center
                     stackView.spacing = 10

                     let containerView = UIView()
                     containerView.addSubview(stackView)
                     stackView.translatesAutoresizingMaskIntoConstraints = false

                     NSLayoutConstraint.activate([
                         stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                         stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                     ])

                     containerView.tag = 100 // Set a unique tag to identify the container view
                     view.addSubview(containerView)
                     containerView.translatesAutoresizingMaskIntoConstraints = false

                     NSLayoutConstraint.activate([
                         containerView.topAnchor.constraint(equalTo: recentsPostCollectionView.topAnchor),
                         containerView.leadingAnchor.constraint(equalTo: recentsPostCollectionView.leadingAnchor),
                         containerView.trailingAnchor.constraint(equalTo: recentsPostCollectionView.trailingAnchor),
                         containerView.bottomAnchor.constraint(equalTo: recentsPostCollectionView.bottomAnchor)
                     ])
                 }
             }
             recentsPostCollectionView.reloadData()
         }
    @IBAction func segmentedControllValueChanged(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
        setDetails()
    }
}
extension RecentPostsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedSegmentIndex == 0{
            return bookmarkedPosts.count
        }
        else {
            return justPostedPosts.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedPostCell", for: indexPath) as! SavedPostCell
        var post: Post
        if selectedSegmentIndex == 0 {
            post = bookmarkedPosts[indexPath.row]
        } else {
            post = justPostedPosts[indexPath.row]
        }
        cell.configure(with: post)
     //   cell.delegate = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20 ) / 2
        return CGSize(width: size, height: size)
    }
}
