//
//  StatisticsViewController.swift
//  Lost&Found
//
//  Created by Agnesa  on 8.6.23.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var statisticsCollectionView: UICollectionView!
    
    var slides: [IntroModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
      
        slides = [IntroModel(title: "", description: "", image: UIImage(named: "s11")!),IntroModel(title: "", description: "", image: UIImage(named: "s1")!),IntroModel(title: "", description: "", image: UIImage(named: "s2")!),IntroModel(title: "", description: "", image: UIImage(named: "s3")!),IntroModel(title: "", description: "", image: UIImage(named: "s4")!),IntroModel(title: "", description: "", image: UIImage(named: "s1")!)]
        pageControl.numberOfPages = slides.count
        
    }
    func setupCollectionView(){
        statisticsCollectionView.dataSource = self
        statisticsCollectionView.delegate = self
        statisticsCollectionView.register(UINib(nibName: "StatsCell", bundle: nil), forCellWithReuseIdentifier: "StatsCell")
    }
}
extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatsCell", for: indexPath) as! StatsCell
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
