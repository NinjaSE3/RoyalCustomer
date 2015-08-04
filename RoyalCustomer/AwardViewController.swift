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
    private var arrowImageView:   UIButton!
    var awardAnimationView: UIImageView!
    
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
        self.addDownArrow()
        
        // スワイプ検知用
        addSwipeRecognizer()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addItemImage(){
        /* 商品イメージを表示 */
        
        // 商品イメージのサイズ
        let itemImageSize:CGFloat = 200
        
        itemImageView = UIImageView(frame: CGRectMake(0,0,self.view.frame.width,itemImageSize))
        let itemImage = UIImage(named: clickItem!.image)
        itemImageView.image = itemImage
        itemImageView.contentMode = UIViewContentMode.ScaleAspectFit
        //itemImageView.layer.borderWidth = 1
        itemImageView.backgroundColor = UIColor.whiteColor()
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
        let brandImageY:CGFloat = 0.12
        
        awardImageView = UIImageView(frame: CGRectMake(0,0,awardImageSize,awardImageSize))
        let awardImage = UIImage(named: clickAward!.image)
        //awardImageView.image = awardImage
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
        let brandImageY:CGFloat = 0.3
        
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
        awardTitleButton.titleLabel!.font = UIFont(name: fontName, size: 23)
        awardTitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        awardTitleButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        awardTitleButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y:UIApplication.sharedApplication().statusBarFrame.height + self.awardTitleButton.frame.height/2
        )
        self.view.addSubview(awardTitleButton)
    }

    
    func addBody(){
        /* 認定説明文を表示 */
        awardBodyButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        
        awardBodyButton.titleEdgeInsets.top = 30
        awardBodyButton.titleEdgeInsets.left = 30
        awardBodyButton.titleEdgeInsets.right = 30
        awardBodyButton.titleEdgeInsets.bottom = 30
        
        //awardBodyButton.backgroundColor = secondaryAwardColor
        awardBodyButton.layer.masksToBounds = true
        awardBodyButton.setTitle(clickAward!.body as String , forState: .Normal)
        awardBodyButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        awardBodyButton.titleLabel!.lineBreakMode = NSLineBreakMode.ByCharWrapping
        awardBodyButton.titleLabel!.font = UIFont(name: fontName, size: 14)
        awardBodyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        awardBodyButton.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
        awardBodyButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: self.itemImageView.frame.maxY+self.awardBodyButton.frame.height/2)
        self.view.addSubview(awardBodyButton)
    }
    
    func addFrom(){
        /* 認定ブランドを表示 */
        awardFromButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        
        awardFromButton.titleEdgeInsets.top = 30
        awardFromButton.titleEdgeInsets.left = 30
        awardFromButton.titleEdgeInsets.right = 30
        awardFromButton.titleEdgeInsets.bottom = 30
        
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
        awardShareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        //awardShareButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        awardShareButton.backgroundColor = facebookColor
        awardShareButton.layer.masksToBounds = true
        awardShareButton.setImage(UIImage(named: "facebookicon"), forState: UIControlState.Normal)
        awardShareButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        awardShareButton.setTitle(" Facebookでシェアする" , forState: .Normal)
        awardShareButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        awardShareButton.titleLabel!.font = UIFont(name: fontName, size: 16)
        //awardShareButton.invalidateIntrinsicContentSize()
        //awardShareButton.sizeToFit()
        awardShareButton.layer.cornerRadius = 5.0
        awardShareButton.addTarget(self, action: "onClickAwardShareButton:", forControlEvents: .TouchUpInside)
        awardShareButton.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: self.awardFromButton.frame.maxY+self.awardShareButton.frame.height/2 + 20)
        self.view.addSubview(awardShareButton)
        
    }
    
    func addDownArrow(){
        /* 閉じる矢印を表示 */
        
        // サイズ
        let imageSize:CGFloat = 40
        // 位置
        let imageY:CGFloat = 0.92
        
        arrowImageView = UIButton(frame: CGRect(x: 0, y: 0, width:self.view.frame.width, height:imageSize))
        arrowImageView.layer.masksToBounds = true
        arrowImageView.setImage(UIImage(named: "DownArrow"), forState: UIControlState.Normal)
        arrowImageView.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        //arrowImageView.backgroundColor = UIColor.redColor()
        arrowImageView.addTarget(self, action: "closeMe:", forControlEvents: .TouchUpInside)
        arrowImageView.layer.position = CGPoint(
            x: self.view.frame.width/2,
            y: self.view.frame.height*imageY + arrowImageView.frame.height/2
        )
        
        self.view.addSubview(arrowImageView)
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
    
    func animationStart(){
        /* アニメーションを描画 */
        println("animationStart")
        self.sparkAnimation()
        
        let startImageSize:CGFloat = 300
        let duration1 = 0.3
        let duration2 = 0.6
        let delay:CFTimeInterval = 1.0
        
        let awardImage = UIImage(named : clickAward!.image)
        awardAnimationView = UIImageView(frame: CGRectMake(0,0,startImageSize,startImageSize))
        awardAnimationView.image = awardImage
        awardAnimationView.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        self.view.addSubview(awardAnimationView)
        
        
        // 拡大
        let toBig = CABasicAnimation(keyPath: "transform.scale")
        toBig.fromValue = 0.0
        toBig.toValue = 1.0
        toBig.duration = duration1
        toBig.beginTime = CACurrentMediaTime()
        toBig.repeatCount = 1
        toBig.removedOnCompletion = false
        toBig.fillMode = kCAFillModeForwards;
        toBig.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        self.awardAnimationView.layer.addAnimation(toBig, forKey: "toBig")
        
        // 移動
        var toPoint: CGPoint = CGPointMake(
            self.awardImageView.layer.frame.midX - awardAnimationView.frame.midX,
            self.awardImageView.layer.frame.midY - awardAnimationView.frame.midY
        )
        var fromPoint: CGPoint = CGPointZero
        
        let movement = CABasicAnimation(keyPath: "position")
        movement.additive = true
        movement.fromValue =  NSValue(CGPoint: fromPoint)
        movement.toValue =  NSValue(CGPoint: toPoint)
        movement.duration = duration2
        movement.beginTime = CACurrentMediaTime() + delay
        movement.repeatCount = 1
        movement.removedOnCompletion = false
        movement.fillMode = kCAFillModeForwards;
        movement.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        self.awardAnimationView.layer.addAnimation(movement, forKey: "movement")
        
        // 縮小
        let toSmoll = CABasicAnimation(keyPath: "transform.scale")
        toSmoll.fromValue = 1.0
        toSmoll.toValue = 0.3
        toSmoll.duration = duration2
        toSmoll.beginTime = CACurrentMediaTime() + delay
        toSmoll.repeatCount = 1
        toSmoll.removedOnCompletion = false
        toSmoll.fillMode = kCAFillModeForwards;
        toSmoll.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        self.awardAnimationView.layer.addAnimation(toSmoll, forKey: "toSmoll")
        
        
    }
    
    var emitterLayer = CAEmitterLayer()
    func sparkAnimation(){
        /* パーティクルを生成 */
        self.emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0)
        self.emitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width / 2.0, 50.0)
        self.emitterLayer.emitterMode = kCAEmitterLayerVolume
        self.emitterLayer.emitterShape = kCAEmitterLayerRectangle
        self.emitterLayer.renderMode = kCAEmitterLayerAdditive
        let emitterCell = CAEmitterCell()
        emitterCell.name = "star"
        emitterCell.emissionLongitude = (CGFloat)(M_PI/2.0)
        emitterCell.emissionRange = (CGFloat)(0.55 * M_PI)
        emitterCell.birthRate = 0.0
        emitterCell.lifetime = 1.2
        emitterCell.velocity = 0
        emitterCell.velocityRange = 500
        emitterCell.yAcceleration = 20
        emitterCell.contents = UIImage(named:"star")!.CGImage
        //emitterCell.color = UIColor(red:0.0, green:0.5, blue:0.5, alpha:0.5).CGColor
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3
        emitterCell.alphaSpeed = -0.5 / emitterCell.lifetime
        emitterCell.scale = 0.2
        emitterCell.scaleSpeed = 1.2
        emitterCell.spinRange = (CGFloat)(2.0 * M_PI)
        
        self.emitterLayer.emitterCells =  [emitterCell];
        //self.view.layer.insertSublayer(self.emitterLayer, atIndex: 0)
        self.view.layer.insertSublayer(self.emitterLayer, atIndex: 100)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let emitterAnimation = CABasicAnimation(keyPath: "emitterCells.star.birthRate")
        emitterAnimation.fromValue		= 100.0
        emitterAnimation.toValue		= 0.0
        emitterAnimation.duration		= 0.4
        emitterAnimation.timingFunction	= CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        
        self.emitterLayer.addAnimation(emitterAnimation, forKey: "starAnimation")
        
        animationStart()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
}
