//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Hashim Saffarini on 03/10/2025.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageContoller: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var sliders : [OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            if currentPage == sliders.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else{
                    nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        sliders = [
             OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
             OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
             OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
         ]
        
        pageContoller.numberOfPages = sliders.count
    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == sliders.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
           } else {
            
               currentPage += 1
               let indexPath = IndexPath(item: currentPage, section: 0)
               collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
               pageContoller.currentPage = currentPage
           }
    }
    
}

extension OnboardingViewController : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setup(sliders[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageContoller.currentPage = currentPage
    }
    
    
    
    
}
