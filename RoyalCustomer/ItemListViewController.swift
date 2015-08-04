//
//  ItemListViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    // 商品ビューのリスト
    struct ItemView {
        var imageView: UIImageView
        var height: CGFloat
        var width: CGFloat
        var x: CGFloat
        var y: CGFloat
    }
    private var itemViews:[ItemView]! = []
    
    // プロフィールビュー
    private var profileView: UIButton!
    
    // スクロールビュー
    private var scrView = MyScrollView()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.createItemViews()
        
        self.navigationView()
        self.profView()
        self.itemListView()
        self.awardListView()
        
        // tabBarItemのアイコンをFeaturedに、タグを2と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 2)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createItemViews(){
        // 商品ViewのArrayを作成
        let cellWidth = self.view.frame.width / 6
        let priority1 = cellWidth*3
        let priority2 = cellWidth*2
        let priority3 = cellWidth*1
        
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority1,priority1)), height: priority1, width: priority1, x: cellWidth*0, y: cellWidth*0) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*0) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*0) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*0) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*1) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*2) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*4, y: cellWidth*1) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*3) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*3) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*3) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*0, y: cellWidth*4) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*4) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*5) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*3, y: cellWidth*3) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*3) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*4) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*6) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*7) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*1, y: cellWidth*6) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority1,priority1)), height: priority1, width: priority1, x: cellWidth*3, y: cellWidth*5) )
        
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*0, y: cellWidth*8) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*8) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*8) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*8) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*8) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*9) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*9) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*4, y: cellWidth*9) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*10) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*10) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*10) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*10) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*11) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*12) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*12) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority2,priority2)), height: priority2, width: priority2, x: cellWidth*2, y: cellWidth*12) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*12) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*12) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*13) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*13) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*13) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*13) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*14) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*15) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*0, y: cellWidth*16) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*1, y: cellWidth*16) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*2, y: cellWidth*16) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*3, y: cellWidth*16) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*4, y: cellWidth*16) )
        itemViews.append( ItemView(imageView: UIImageView(frame: CGRectMake(0,0,priority3,priority3)), height: priority3, width: priority3, x: cellWidth*5, y: cellWidth*16) )
    }
    
    func navigationView(){
        // ナビゲーションの表示
        //var imgButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        //imgButton.setImage(UIImage(named: "User1"), forState: UIControlState.Normal)
        //imgButton.addTarget(self.navigationController, action: Selector("onClickProfile:"), forControlEvents:  UIControlEvents.TouchUpInside)
        //var imgButtonItem = UIBarButtonItem(customView: imgButton)
        //self.navigationItem.leftBarButtonItem = imgButtonItem
        //self.navigationItem.title = "購入商品一覧"
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        title.textColor = primaryBackgroundColor
        title.text = "購入商品一覧"
        title.font = UIFont(name: fontName, size: 16)
        title.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = title
    }
    
    func profView(){
        // プロフィールの表示
        profileView = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        profileView.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        profileView.backgroundColor=secondaryBackgroundColor
        profileView.layer.masksToBounds = true
        profileView.setTitle("十一時七雄さん" , forState: .Normal)
        profileView.setTitleColor(primaryColor, forState: .Normal)
        profileView.titleLabel!.font = UIFont(name: fontName, size: 18)
        //profileView!.font = UIFont(name: "Helvetica",size: CGFloat(10))
        profileView.layer.position = CGPoint(x: self.profileView.frame.width/2, y:self.profileView.frame.height/2)
        profileView.setImage(UIImage(named: "User0"), forState: UIControlState.Normal)
        profileView.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        //profileView.imageView?.layer.cornerRadius = 5
        profileView.imageView?.layer.borderColor = secondaryBackgroundColor.CGColor
        profileView.imageView?.layer.borderWidth = 5
    }
    
    func itemListView(){
        // 商品一覧を作成
        var borderColor:CGColor = primaryBackgroundColor.CGColor
        var borderWidth:CGFloat = 2
        
        var i = 0
        var pageHeight: CGFloat = 0
        var item: ItemView
        for item in itemViews {
            let itemImage = UIImage(named: items[i].image)
            item.imageView.image = itemImage
            item.imageView.tag = i
            item.imageView.layer.borderColor = borderColor
            item.imageView.layer.borderWidth = borderWidth
            item.imageView.backgroundColor = UIColor.redColor()
            item.imageView.layer.position = CGPoint(
                x: item.x + item.imageView.frame.width/2,
                y: item.y + item.imageView.frame.height/2 + self.profileView.frame.height
            )
            item.imageView.userInteractionEnabled = true
            
            if pageHeight < item.y + item.imageView.frame.height{
                pageHeight = item.y + item.imageView.frame.height
            }
            i++
        }
        
        /* スクロールview */
        // タッチイベントを即時取得
        scrView.delaysContentTouches = false
        // ページサイズ
        scrView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        // 全体のサイズ
        scrView.contentSize = CGSizeMake(view.bounds.width, pageHeight+self.profileView.frame.height)
        // 配置
        scrView.layer.position = CGPoint(
            x: scrView.frame.width/2,
            y: scrView.frame.height/2
        )
        let gesture = UITapGestureRecognizer(target:self, action:"onClickItemImageView:")
        scrView.addGestureRecognizer(gesture)
        self.view.addSubview(scrView)
        
        // 各イメージを追加
        scrView.addSubview(profileView)
        for item in itemViews {
            scrView.addSubview(item.imageView)
        }
        
    }
    
    func awardListView(){
        /* 認定アイコンを表示 */
        
        // アイコンサイズ・位置係数
        let awardIconSize:CGFloat = 0.25
        let awardIconX:CGFloat = 0.85
        
        var i = 0
        var item: ItemView
        for item in itemViews{
            if !items[i].award1.isEmpty || !items[i].award2.isEmpty {
                let awardIconImage = UIImage(named: "Award1_1_icon")!
                var awardIconView = UIImageView(frame: CGRectMake(0,0,item.imageView.frame.width*awardIconSize,item.imageView.frame.height*awardIconSize))
                awardIconView.tag = i
                awardIconView.image = awardIconImage
                awardIconView.layer.position = CGPoint(
                    x: item.imageView.frame.minX + item.imageView.frame.width * awardIconX + awardIconSize / 2,
                    y: item.imageView.frame.minY + item.imageView.frame.width * awardIconSize / 2
                )
                awardIconView.userInteractionEnabled = true
                scrView.addSubview(awardIconView)
            }
            
            i++
        }
    }
    
    
    // 商品クリック時にクリックされた商品を特定する
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var tag:Int = touch.view.tag
        clickItem = items[tag]
        println(clickItem!.itemid)
    }
    
    // 商品クリック時に商品詳細画面に遷移する
    func onClickItemImageView(recognizer: UIGestureRecognizer) {
        println("test")
        let itemViewController: UIViewController = ItemViewController()
        navigationController?.pushViewController(itemViewController, animated: true)
    }
    
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
        }
    }
}
