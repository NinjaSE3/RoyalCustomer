//
//  AwardViewController.swift
//  RoyalCustomer
//
//  Created by 林田 敦 on 2015/07/30.
//  Copyright (c) 2015年 NRI. All rights reserved.
//
//
//  ItemListViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class AwardViewController: UIViewController {
    
    // スクロールビュー
    //private var scrView = MyScrollView()
    
    // 要素の宣言
    private var itemImageView:    UIImageView!
    private var brandImageView:   UIImageView!
    private var awardImageView:   UIImageView!
    private var awardTitleButton: UIButton!
    private var awardBodyButton:  UIButton!
    private var awardFromButton:  UIButton!
    private var awardShareButton: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色を設定する.
        self.view.backgroundColor = secondaryAwardColor
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.addTitle()
        self.addItemImage()
        self.addBrandImage()
        self.addAwardImage()
        self.addBody()
        self.addFrom()
        self.addShare()
        
        // スワイプ検知用
        addSwipeRecognizer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addItemImage(){
        /* 商品イメージを表示 */
        
        // 商品イメージのサイズ
        let itemImageSize:CGFloat = 180
        
        itemImageView = UIImageView(frame: CGRectMake(0,0,self.view.frame.width,itemImageSize))
        let itemImage = UIImage(named: clickItem!.image)
        itemImageView.image = itemImage
        itemImageView.contentMode = UIViewContentMode.ScaleAspectFit
        //itemImageView.layer.borderWidth = 1
        //itemImageView.backgroundColor = UIColor.redColor()
        itemImageView.layer.position = CGPoint(
            x: self.view.frame.width/2,
            y: self.awardTitleButton.frame.maxY + itemImageView.frame.height/2
        )
        
        self.view.addSubview(itemImageView)
    }

    
    func addAwardImage(){
        /* 認定イメージを表示 */
        
        // サイズ
        let awardImageSize:CGFloat = 90
        // 位置
        let brandImageX:CGFloat = 0.7
        let brandImageY:CGFloat = 0.1
        
        awardImageView = UIImageView(frame: CGRectMake(0,0,awardImageSize,awardImageSize))
        let awardImage = UIImage(named: clickAward!.image)
        awardImageView.image = awardImage
        //awardImageView.layer.borderWidth = 1
        //awardImageView.backgroundColor = UIColor.redColor()
        awardImageView.layer.position = CGPoint(
            x: self.view.frame.width*brandImageX + awardImageView.frame.width/2,
            y: self.view.frame.height*brandImageY + awardImageView.frame.height/2
        )
        
        self.view.addSubview(awardImageView)
    }
    
    func addBrandImage(){
        /* ブランドロゴを表示 */
        
        // サイズ
        let brandImageSize:CGFloat = 70
        // 位置
        let brandImageX:CGFloat = 0.1
        let brandImageY:CGFloat = 0.25
        
        brandImageView = UIImageView(frame: CGRectMake(0,0,brandImageSize,brandImageSize))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        //brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
        brandImageView.layer.borderWidth = 1
        brandImageView.layer.borderColor = primaryColor.CGColor
        brandImageView.layer.cornerRadius = brandImageSize/2
        brandImageView.clipsToBounds = true
        //brandImageView.backgroundColor = UIColor.redColor()
        brandImageView.layer.position = CGPoint(
            x: self.view.frame.width*brandImageX + brandImageView.frame.width/2,
            y: self.view.frame.height*brandImageY + brandImageView.frame.height/2
        )
        
        self.view.addSubview(brandImageView)
    }
    
    func addTitle(){
        /* 認定タイトルを表示 */
        
        awardTitleButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        awardTitleButton.backgroundColor = primaryAwardColor
        awardTitleButton.layer.masksToBounds = true
        awardTitleButton.setTitle(clickAward!.title as String , forState: .Normal)
        awardTitleButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        awardTitleButton.titleLabel!.font = UIFont(name: fontName, size: 25)
        awardTitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        awardTitleButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        awardTitleButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.awardTitleButton.frame.height/2)
        self.view.addSubview(awardTitleButton)
    }

    
    func addBody(){
        /* 認定説明文を表示 */
        awardBodyButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        
        awardBodyButton.titleEdgeInsets.top = 20
        awardBodyButton.titleEdgeInsets.left = 20
        awardBodyButton.titleEdgeInsets.right = 20
        awardBodyButton.titleEdgeInsets.bottom = 20
        
        //awardBodyButton.backgroundColor = secondaryAwardColor
        awardBodyButton.layer.masksToBounds = true
        awardBodyButton.setTitle(clickAward!.body as String , forState: .Normal)
        awardBodyButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        awardBodyButton.titleLabel!.font = UIFont(name: fontName, size: 14)
        awardBodyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        awardBodyButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: self.itemImageView.frame.maxY+self.awardBodyButton.frame.height/2)
        self.view.addSubview(awardBodyButton)
    }
    
    func addFrom(){
        /* 認定ブランドを表示 */
        awardFromButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        
        awardFromButton.titleEdgeInsets.top = 20
        awardFromButton.titleEdgeInsets.left = 20
        awardFromButton.titleEdgeInsets.right = 20
        awardFromButton.titleEdgeInsets.bottom = 20
        
        //awardFromButton.backgroundColor = UIColor.blueColor()
        awardFromButton.layer.masksToBounds = true
        awardFromButton.setTitle(clickAward!.from as String , forState: .Normal)
        awardFromButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        awardFromButton.titleLabel!.font = UIFont(name: fontName, size: 14)
        awardFromButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        awardFromButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: awardBodyButton.frame.maxY+self.awardFromButton.frame.height/2)
        self.view.addSubview(awardFromButton)
    }
    
    func addShare(){
        /* シェアボタンを表示 */
        awardShareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        awardShareButton.backgroundColor = UIColor.blueColor()
        awardShareButton.layer.masksToBounds = true
        awardShareButton.setTitle("Facebookでシェアする" , forState: .Normal)
        awardShareButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        awardShareButton.titleLabel!.font = UIFont(name: fontName, size: 16)
        awardShareButton.layer.cornerRadius = 5.0
        awardShareButton.addTarget(self, action: "onClickAwardShareButton:", forControlEvents: .TouchUpInside)
        awardShareButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y:self.awardFromButton.frame.maxY+self.awardShareButton.frame.height/2)
        self.view.addSubview(awardShareButton)
    }
    
    
    // シェアボタンクリック時にシェア画面に遷移する
    func onClickAwardShareButton(recognizer: UIGestureRecognizer) {
        println("onClickAwardShareButton")
        //let shareViewController: UIViewController = ShareViewController()
        //navigationController?.pushViewController(shareViewController, animated: true)
    }
    
    /*
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
        }
    }
    */
    
    /* 閉じるボタン表示 */
    func addCloseButton(){
        let closeMeBtn = UIButton(frame: CGRectMake(0, 0, 300, 50))
        closeMeBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:100)
        closeMeBtn.setTitle("Close Me!", forState: .Normal)
        closeMeBtn.addTarget(self, action: "closeMe:", forControlEvents: .TouchUpInside)
        self.view.addSubview(closeMeBtn)
    }
    
    // 閉じるボタンで閉じる
    func closeMe(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
    * スワイプ検知用に登録
    */
    func addSwipeRecognizer() {
//        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
//        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
//        
//        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
//        self.view.addGestureRecognizer(swipeLeft)
//        self.view.addGestureRecognizer(swipeRight)
//        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
    }
    
    /**
    * スワイプ
    */
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                // 左
                println("left")
            case UISwipeGestureRecognizerDirection.Right:
                // 右
                println("right")
            case UISwipeGestureRecognizerDirection.Up:
                // 上
                println("up")
            case UISwipeGestureRecognizerDirection.Down:
                // 下
                println("down")
                dismissViewControllerAnimated(true, completion: nil)
                
            default:
                // その他
                println("other")
                break
            }
            
        }
    }
    
}
