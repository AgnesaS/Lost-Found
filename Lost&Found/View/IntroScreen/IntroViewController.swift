//
//  ViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import UIKit
import Firebase

class IntroViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var slidesCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControll: UIPageControl!
    
    var slides: [IntroModel] = []
    var currentPage = 0 {
        didSet {
            pageControll.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "HasLaunchedBefore")
        
        if hasLaunchedBefore {
            navigateToNextScreen()
        } else {

        }
        
        slidesCollectionView.dataSource = self
        slidesCollectionView.delegate = self
        slidesCollectionView.register(UINib(nibName: "SlideCell", bundle: nil), forCellWithReuseIdentifier: "SlideCell")
        
        slides = [IntroModel(title: "Lost, Found and Reunited", description: "Where lost items find their way back home.", image: UIImage(named: "1")!),
                  IntroModel(title: "Just a click.", description: "Capture and share your findings within our app", image: UIImage(named: "2")!),
                  IntroModel(title: "The power of connection", description: "Join and recover what's missing.", image: UIImage(named: "3")!)]
        pageControll.numberOfPages = slides.count
        
    }
    func navigateToNextScreen() {
        if Auth.auth().currentUser != nil {
            navigateToHomeScreen()
        } else {
            navigateToLoginScreen()
        }
    }
    
    func navigateToHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBaarViewController")
        UIApplication.shared.windows.first?.rootViewController = homeViewController
    }
    
    func navigateToLoginScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        UIApplication.shared.windows.first?.rootViewController = loginViewController
    }
    //MARK: IBActions
    @IBAction func nextButtonPressed(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
//            UserDefaults.standard.set(true, forKey: "HasLaunchedBefore") // Update the flag indicating the app has been launched
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            slidesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
extension IntroViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCell.identifier, for: indexPath ) as! SlideCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

