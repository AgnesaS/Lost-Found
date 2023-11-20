//
//  RecentPostsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 6.6.23.
//

import UIKit

class RecentPostsViewController: UIViewController, HomeViewControllerDelegate{
    func didUpdateBookmarkedPosts(_ bookmarkedPosts: [Post]) {
        self.bookmarkedPosts = bookmarkedPosts
        recentsPostCollectionView.reloadData()
        print("didupdatebookmarkedposts yipeee")
        print("RecentPostsViewController - didUpdateBookmarkedPosts() called")
        print("RecentPostsViewController - bookmarkedPosts: \(bookmarkedPosts)")
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var recentsPostCollectionView: UICollectionView!
    //MARK: Proporties
    var bookmarkedPosts: [Post] = []

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Perform your refresh operation here
        refresh()
    }
    func refresh() {
        assignPosts()
        recentsPostCollectionView.reloadData()
        setDetails()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    func assignPosts() {
        bookmarkedPosts = HomeViewController.instance.bookmarkedPosts
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
            recentsPostCollectionView.reloadData()
         }
    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        
    }
}
extension RecentPostsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return bookmarkedPosts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedPostCell", for: indexPath) as! SavedPostCell
        var post: Post
            post = bookmarkedPosts[indexPath.row]
        cell.configure(with: post)
     //   cell.delegate = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20 ) / 2
        return CGSize(width: size, height: size)
    }
}
