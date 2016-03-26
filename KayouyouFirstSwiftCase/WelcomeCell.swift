//
//  WelcomeCell.swift
//  KayouyouFirstSwiftCase
//
//  Created by 叶杨杨 on 16/3/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class WelcomeCell: UICollectionViewCell {

   private let  welcomeImageView = UIImageView(frame: ScreenBounds)
   private let  nextButton = UIButton(frame: CGRectMake((ScreenWidth - 100)*0.5,ScreenHeight - 110,100 ,33))
    

    var newImage:UIImage?{
        
        didSet {
            
            welcomeImageView.image = newImage
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        welcomeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        nextButton.setBackgroundImage(UIImage(named: "icon_next"), forState: UIControlState.Normal)

        nextButton.addTarget(self, action: "nextButtonClick", forControlEvents:UIControlEvents.TouchUpInside)
        
        nextButton.hidden = true
        contentView.addSubview(nextButton)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setNextButtonHidden(hidden: Bool){
        nextButton.hidden = hidden;
    }
    /**
     button clicked event
     */
    func nextButtonClick() {
        
      NSNotificationCenter.defaultCenter().postNotificationName(WelcomeViewControllerDidFinished, object: nil)
    
    }
    
    
}
