//
//  WelcomeViewController.swift
//  KayouyouFirstSwiftCase
//
//  Created by 叶杨杨 on 16/3/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit
import SDWebImage
class WelcomeViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource{
 /// 属性
    private var collectionView: UICollectionView?
    private var imageNames = ["guide_40_1", "guide_40_2", "guide_40_3", "guide_40_4"]
    private let cellIdentifiers = "WelcomeCell"
    private var isHidedNextBUtton = true
    private var pageController = UIPageControl(frame: CGRectMake(0,ScreenHeight - 50,ScreenWidth,20))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        
    
        buildCollectionView()
        buildPageController()
        
    }
    /**
    欢迎界面
     */
    private func buildCollectionView(){
     
        let flowLayOut = UICollectionViewFlowLayout()
        flowLayOut.minimumInteritemSpacing = 0
        flowLayOut.minimumLineSpacing = 0
        flowLayOut.itemSize = ScreenBounds.size
        flowLayOut.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView = UICollectionView(frame: ScreenBounds, collectionViewLayout: flowLayOut)
        collectionView?.delegate = self;
        collectionView?.dataSource = self;
        collectionView?.registerClass( WelcomeCell.self, forCellWithReuseIdentifier: cellIdentifiers)
        
        self.view.addSubview(collectionView!)
    }
    /**
     page controller
     */
    private func buildPageController(){
        
        pageController.numberOfPages = imageNames.count;
        
        pageController.currentPage = 0
        
        view.addSubview(pageController)
    }
    /**
     collectionview 代理
     
     - parameter collectionView: collectionview
     - parameter section:        section
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageNames.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //as! 类型转换
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifiers, forIndexPath: indexPath) as! WelcomeCell
        cell.newImage = UIImage(named: imageNames[indexPath.row])

        if indexPath.row != imageNames.count - 1 {
            
            cell.setNextButtonHidden(true)
            
        }
        
        
        return cell
    
    }
    /**
     滑动到最后一页时 显示button
     
     - parameter scrollView: <#scrollView description#>
     */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == ScreenWidth * CGFloat(imageNames.count - 1){
           
            let cell = collectionView?.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection: 0)) as! WelcomeCell
            cell.setNextButtonHidden(false)
            isHidedNextBUtton = false
        }
    }
    /**
     改变pagecontroll的位置
     
     - parameter scrollView: <#scrollView description#>
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
       
        if scrollView.contentOffset.x != ScreenWidth * CGFloat(imageNames.count - 1) && !isHidedNextBUtton && scrollView.contentOffset.x > ScreenWidth * CGFloat(imageNames.count - 2) {
            let cell = collectionView!.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection: 0)) as! WelcomeCell
            cell.setNextButtonHidden(true)
            isHidedNextBUtton = true
        }
        
        pageController.currentPage = Int(scrollView.contentOffset.x / ScreenWidth + 0.5)
  
    }
    
    
    
}
