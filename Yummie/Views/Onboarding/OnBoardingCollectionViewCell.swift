//
//  OnBoardingCollectionViewCell.swift
//  Yummie
//
//  Created by Hashim Saffarini on 03/10/2025.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var sliderImage: UIImageView!
    
    @IBOutlet weak var slidertitleLbl: UILabel!
    
    
    @IBOutlet weak var sliderDescriptionLbl: UILabel!
    
    func setup(_ slide : OnboardingSlide){
        sliderImage.image = slide.image
        slidertitleLbl.text = slide.title
        sliderDescriptionLbl.text = slide.description
    }
}
