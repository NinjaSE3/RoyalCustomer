//
//  ItemInfoViewController.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/08/04.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class ItemInfoViewController: UIViewController{

        // View定義
    var itemViewScrollView = MyScrollView()
    var myWebView : UIWebView!
    
    var itemImageView:UIImageView!
    
    var brandImageView:UIImageView!
    
    // Viewに関する情報取得
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    
    // itemtabボタン
    var itemTabLeft:UIButton!
    var itemTabRight:UIButton!

    let itemTabHight:   CGFloat = 60
    let itemHeight:     CGFloat = 180
    let itemWidth:      CGFloat = 200
    let brandHeight:    CGFloat = 50
    let brandWidth:     CGFloat = 50
    
    override func viewDidLoad() {
        
        //開発用のため、削除すること
        clickItem = items[0]
        println(clickItem)
        //開発用のため、削除すること

        super.viewDidLoad()
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = primaryBackgroundColor
        
        self.createItemTabView()
        self.createBrandImageView()
        self.createItemImageView()
        self.createWebView()
        self.createItemViewScrollView()
        
        self.view.addSubview(itemTabLeft)
        self.view.addSubview(itemTabRight)
        self.view.addSubview(itemViewScrollView)
        itemViewScrollView.addSubview(itemImageView)
        itemViewScrollView.addSubview(brandImageView)
        itemViewScrollView.addSubview(myWebView)

    }
    
    func createItemTabView(){
        itemTabLeft = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: itemTabHight))
        itemTabRight = UIButton(frame: CGRect(x: self.view.frame.width/2, y: 0, width: self.view.frame.width/2, height: itemTabHight))
        
        itemTabLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        itemTabLeft.backgroundColor=secondaryBackgroundColor
        itemTabLeft.layer.masksToBounds = true
        itemTabLeft.setTitle("購買履歴" , forState: .Normal)
        itemTabLeft.setTitleColor(primaryColor, forState: .Normal)
        itemTabLeft.titleLabel!.font = UIFont(name: fontName, size: 18)
        itemTabLeft.layer.position = CGPoint(x: self.itemTabLeft.frame.width/4, y:self.itemTabLeft.frame.height/2)
        itemTabLeft.imageView?.layer.borderColor = secondaryBackgroundColor.CGColor
        itemTabLeft.imageView?.layer.borderWidth = 5
        
        itemTabRight.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        itemTabRight.backgroundColor=secondaryBackgroundColor
        itemTabRight.layer.masksToBounds = true
        itemTabRight.setTitle("購買履歴" , forState: .Normal)
        itemTabRight.setTitleColor(primaryColor, forState: .Normal)
        itemTabRight.titleLabel!.font = UIFont(name: fontName, size: 18)
        itemTabRight.layer.position = CGPoint(x: self.itemTabRight.frame.width/4, y:self.itemTabRight.frame.height/2)
        itemTabRight.imageView?.layer.borderColor = secondaryBackgroundColor.CGColor
        itemTabRight.imageView?.layer.borderWidth = 5
    }
    
    
    func createBrandImageView(){
        // ブランドロゴ付与
        brandImageView = UIImageView(frame: CGRectMake(10, itemHeight - itemHeight/3.0, brandWidth, brandHeight))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        brandImageView.layer.cornerRadius = brandImageView.frame.size.width / 2.0
        brandImageView.clipsToBounds = true
        brandImageView.layer.borderColor = primaryColor.CGColor
        brandImageView.layer.borderWidth = 2
        brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    func createItemImageView(){
        // 商品画像の表示（ユーザーテスト用）
        itemImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, itemHeight)) // UIScrollview内での位置設定であることに注意
        let iteminImage = UIImage(named: clickItem!.image)
        itemImageView.image = iteminImage
        itemImageView.contentMode = UIViewContentMode.Center
        itemImageView.clipsToBounds = true
    }
    
    func createWebView(){
        // webViewを生成.
        myWebView = UIWebView(frame: CGRectMake(0, itemHeight, self.view.bounds.width, self.view.bounds.height * 5 - itemHeight))
        // ファイルパスを生成.
        let path: NSString = NSBundle.mainBundle().pathForResource("webview", ofType:"html")!
        // requestを生成.
        let request:NSURLRequest = NSURLRequest(URL: NSURL.fileURLWithPath(path as String)!)
        // fullscreen表示ではなく、inline表示にする.
        myWebView.allowsInlineMediaPlayback = false
        // 自動的に再生を開始.
        myWebView.mediaPlaybackRequiresUserAction = false
        
        myWebView.scrollView.scrollEnabled = false
        // load開始.
        myWebView.loadRequest(request)
    }
    
    func createItemViewScrollView(){
        // 商品詳細View表示用UIScrollView作成
        itemViewScrollView.frame = CGRectMake(0,0, view.bounds.width, view.bounds.height + self.navigationController!.navigationBar.bounds.size.height + UIApplication.sharedApplication().statusBarFrame.size.height - itemTabHight)
        itemViewScrollView.layer.position = CGPoint(
            x:view.bounds.width/2,
            y:itemViewScrollView.frame.height/2 + itemTabHight + self.navigationController!.navigationBar.bounds.size.height + UIApplication.sharedApplication().statusBarFrame.size.height
        )
        // タッチイベントを即時取得
        itemViewScrollView.delaysContentTouches = false
        itemViewScrollView.backgroundColor = UIColor.redColor()
        itemViewScrollView.pagingEnabled = false
        itemViewScrollView.bounces = true
        itemViewScrollView.scrollEnabled = true
        itemViewScrollView.directionalLockEnabled = false
        itemViewScrollView.showsHorizontalScrollIndicator = true
        itemViewScrollView.showsVerticalScrollIndicator = false
        itemViewScrollView.contentSize = CGSizeMake(self.view.bounds.width, self.view.bounds.height * 5 - self.navigationController!.navigationBar.bounds.size.height - UIApplication.sharedApplication().statusBarFrame.size.height )
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
            println("Calltouches2")
        }
    }
    

}
