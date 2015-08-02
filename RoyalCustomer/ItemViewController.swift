//
//  ItemViewController.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit


class ItemViewController: UIViewController{
    
    // View定義
    private var pScrollView:     UIScrollView!
    private var itemViewScrollView = MyScrollView()
    
    // Viewに関する情報取得
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height

    override func viewDidLoad() {

        // 素材の高さ、幅
        let navBarHeight:   CGFloat = self.navigationController!.navigationBar.bounds.size.height
        let shohinHeight:   CGFloat = 180
        let shohinWidth:    CGFloat = 200
        let sOutlineHeight: CGFloat = 50
        let brandHeight:    CGFloat = 50
        let brandWidth:     CGFloat = 50
        let badgeTxtHeight: CGFloat = 15
        let badgeHeight:    CGFloat = 50
        let badgeWidth:     CGFloat = 50
        let pGraphHeight:   CGFloat = 250
        let pGraphWidth:    CGFloat = 350
        
        // 素材の位置
        let baf:            CGFloat = 10 //　素材間のバッファ
        let bafBadge:       CGFloat = 5  //　バッジ間のバッファ
        let shohinOutlinePosition: CGFloat = shohinHeight + baf
        let linePosition: CGFloat = shohinOutlinePosition + sOutlineHeight + baf
        let bLabelPosition: CGFloat = linePosition + baf
        let badgePosiY:     CGFloat = bLabelPosition + badgeTxtHeight + baf
        let badgeNumPosiY:  CGFloat = bLabelPosition + badgeTxtHeight + bafBadge
        let pLabelPosition: CGFloat = badgePosiY + badgeHeight + baf + bafBadge
        let pGraphPosition: CGFloat = badgePosiY + badgeHeight + baf
        let pButtonThisMPosiY: CGFloat = pGraphPosition + pGraphHeight + baf
        let pCalPosition:   CGFloat = pButtonThisMPosiY + badgeTxtHeight + baf

        
        let txtArePosiX: CGFloat = 20
        
        // 素材文言
        let bLabText:       String = "取得した認定バッジ&トロフィー"
        let pLabText:       String = "商品購入数"
        let pCalLabText:       String = "当月購入カレンダー"

        // 購買情報
        var prchedDateArray :[String] = []
        var prchedNumArray :[Int] = []
        
        
        // 表示する商品画像を設定　TODO:商品一覧から受け取ったURLを設定
//        let shohinUrl = NSURL(string:"http://www.7meal.jp/prd/044996/01250/04008427_01_00.jpg")
//        let sReq = NSURLRequest(URL:shohinUrl!)
        
        //　表示するバッジ画像を設定　TODO:商品一覧から受け取ったURLを設定
//        let badgeUrlStr: [String] = ["http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg","http://odagirist.net/icon/rank/1.png","http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg", "http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg"]
        
        /* 商品画像の生成 */
        // 非同期検索＆表示
//        NSURLConnection.sendAsynchronousRequest(sReq, queue:NSOperationQueue.mainQueue()){(res, data, err) in
//            let shohinImage = UIImage(data:data)
//            
//            // UIImageViewの生成 TODO：表示位置の動的設定
//            let shohinImageView = UIImageView(image:shohinImage)
//            shohinImageView.frame = CGRectMake(0, navBarHeight, shohinHeight, shohinWidth)
//            self.view.addSubview(shohinImageView)
//        }
        
        super.viewDidLoad()
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = primaryBackgroundColor
        
        // ナビゲーションバーに商品名を表示
        //var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        title.textColor = primaryBackgroundColor
        //title.backgroundColor = UIColor.redColor()
        title.text = clickItem!.name as String
        title.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = title
        super.viewDidLoad()
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 商品詳細View表示用UIScrollView作成
        itemViewScrollView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        // タッチイベントを即時取得
        itemViewScrollView.delaysContentTouches = false
        itemViewScrollView.backgroundColor = UIColor.clearColor()
        itemViewScrollView.pagingEnabled = false
        itemViewScrollView.bounces = true
        itemViewScrollView.scrollEnabled = true
        itemViewScrollView.directionalLockEnabled = false
        itemViewScrollView.showsHorizontalScrollIndicator = true
        itemViewScrollView.showsVerticalScrollIndicator = false
        itemViewScrollView.contentSize = CGSizeMake(self.view.bounds.width, self.view.bounds.height * 1.3)
        self.view.addSubview(itemViewScrollView)
        
        
        // 商品画像の表示（ユーザーテスト用）
        let shohinImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, shohinHeight)) // UIScrollview内での位置設定であることに注意
        let shohinImage = UIImage(named: clickItem!.image)
        shohinImageView.image = shohinImage

        // 縦横比保持 TODO:画像のサイズ調整
        //  shohinImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        itemViewScrollView.addSubview(shohinImageView)
        
        // ブランドロゴ付与
        let brandImageView = UIImageView(frame: CGRectMake(10, shohinHeight - shohinHeight/3.0, brandWidth, brandHeight))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        brandImageView.layer.cornerRadius = brandImageView.frame.size.width / 2.0
        brandImageView.clipsToBounds = true
        brandImageView.layer.borderColor = primaryColor.CGColor
        brandImageView.layer.borderWidth = 2
//        brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
        itemViewScrollView.addSubview(brandImageView)
        
        // 商品説明のset
        let shohinOutline: UIButton = UIButton(frame: CGRectMake(txtArePosiX,shohinOutlinePosition,self.view.bounds.width,sOutlineHeight))
        shohinOutline.setTitle(clickItem!.outline, forState: UIControlState.Normal)
        shohinOutline.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        shohinOutline.titleLabel!.numberOfLines = 3
        shohinOutline.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        shohinOutline.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        itemViewScrollView.addSubview(shohinOutline)
        
        // 仕切り線設定
        let lineUIImageView = UIImageView(frame: CGRectMake(0, linePosition, self.view.bounds.width, 5))
        let lineImage = UIImage(named: "line1")
        lineUIImageView.image = lineImage
        itemViewScrollView.addSubview(lineUIImageView)

        /* 認定バッジの生成 */
        // 認定バッジ説明のset
        let bButton: UIButton = UIButton(frame: CGRectMake(txtArePosiX,bLabelPosition, self.view.bounds.width,badgeTxtHeight))
        bButton.setTitle(bLabText, forState: UIControlState.Normal)
        bButton.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        bButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        bButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        itemViewScrollView.addSubview(bButton)
        
        // ラベル取得＆表示
        var badgePosiX: CGFloat = txtArePosiX
        
        // 認定バッジ生成（ユーザーテスト用）
        for aNum in clickItem!.award1 {
            let badgeImagStr: String = awards[Int(aNum)].image
            var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth))
            let badgeImage = UIImage(named: badgeImagStr)
            badgeImageView.image = badgeImage
            badgeImageView.userInteractionEnabled = true //タップを認識させる
            let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
            badgeImageView.addGestureRecognizer(badgeImageTap)
            badgeImageView.tag = Int(aNum)
            itemViewScrollView.addSubview(badgeImageView)

            
           // バッジに付与する認定実績
            var badgeNum: UIButton = UIButton(frame: CGRectMake(badgePosiX+35, badgeNumPosiY, badgeHeight/3, badgeWidth/3))
            badgeNum.setTitle(String(awards[Int(aNum)].num), forState: UIControlState.Normal)
            badgeNum.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 8)
            badgeNum.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            badgeNum.backgroundColor = UIColor.grayColor()
            badgeNum.layer.cornerRadius = badgeNum.layer.frame.size.width / 2.0
            itemViewScrollView.addSubview(badgeNum)
            
            badgePosiX = badgePosiX + badgeWidth + bafBadge

        }
        
        for aNum in clickItem!.award2 {
            let badgeImagStr: String = awards[Int(aNum)].image
            var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth))
            let badgeImage = UIImage(named: badgeImagStr)
            badgeImageView.image = badgeImage
            badgeImageView.userInteractionEnabled = true
            let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
            badgeImageView.addGestureRecognizer(badgeImageTap)
            badgeImageView.tag = Int(aNum)
            itemViewScrollView.addSubview(badgeImageView)

            
            // バッジに付与する認定実績
            var badgeNum: UIButton = UIButton(frame: CGRectMake(badgePosiX+35, badgeNumPosiY, badgeHeight/3, badgeWidth/3))
            badgeNum.setTitle(String(awards[Int(aNum)].num), forState: UIControlState.Normal)
            badgeNum.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 8)
            badgeNum.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            badgeNum.backgroundColor = UIColor.grayColor()
            badgeNum.layer.cornerRadius = badgeNum.layer.frame.size.width / 2.0
            itemViewScrollView.addSubview(badgeNum)
            
            badgePosiX = badgePosiX + badgeWidth + bafBadge

        }
        
        
        /* 購入情報の生成 */
        // 購入情報説明用ラベル表示
        let pButton: UIButton = UIButton(frame: CGRectMake(0,pLabelPosition, self.view.bounds.width,badgeTxtHeight))
        pButton.setTitle(pLabText, forState: UIControlState.Normal)
        pButton.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 13)
        pButton.setTitleColor(primaryColor, forState: UIControlState.Normal)
        itemViewScrollView.addSubview(pButton)
        
        
        // 購入グラフ&カレンダー表示用UIScrollView作成
        pScrollView = UIScrollView(frame: self.view.bounds)
        pScrollView.frame = CGRectMake(0, pGraphPosition, 350, 250)
        pScrollView.backgroundColor = UIColor.clearColor()
        pScrollView.contentSize   = CGSizeMake(700, 250)
       // pScrollView.contentOffset = CGPointMake(self.view.bounds.width , 0.0);
        pScrollView.pagingEnabled = true
        pScrollView.bounces = true
        pScrollView.scrollEnabled = true
        pScrollView.directionalLockEnabled = true
        pScrollView.showsHorizontalScrollIndicator = true
        pScrollView.showsVerticalScrollIndicator = false

        
        // 購入情報の取り出し
        var keys = Array(clickItem!.prchedHist.keys)
        // keysを昇順でソートする
        keys.sort({
            $0 < $1
        })
        
        for sortKey in keys {
            for (date, num) in clickItem!.prchedHist {
                if sortKey == date {
                var dates:[String] = date.componentsSeparatedByString("/")
                prchedDateArray.append(dates[1]+"月")
                prchedNumArray.append(num)
                }
            }
        }
        // 購入グラフ表示
        var barChart = PNBarChart(frame: CGRectMake(txtArePosiX, pGraphPosition, pGraphWidth, pGraphHeight))
        barChart.backgroundColor = UIColor.clearColor()
        barChart.labelMarginTop = 5.0
        barChart.xLabels = prchedDateArray
        barChart.yValues = prchedNumArray
        barChart.strokeColor = primaryColor
        barChart.showLabel = false
        barChart.strokeChart()
        
       itemViewScrollView.addSubview(barChart)

        
       // カレンダー表示
       // 当月購買詳細ラベル表示
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM";
        var dateString:String = dateFormatter.stringFromDate(NSDate());
        let pCalTxt = pCalLabText+"  "+dateString
        
        let pButtonThisM: UIButton = UIButton(frame: CGRectMake(0,pButtonThisMPosiY, self.view.bounds.width,badgeTxtHeight))
        pButtonThisM.setTitle(pCalTxt, forState: UIControlState.Normal)
        pButtonThisM.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 13)
        pButtonThisM.setTitleColor(primaryColor, forState: UIControlState.Normal)
        itemViewScrollView.addSubview(pButtonThisM)
        
       var calenderView:CalenderView = CalenderView(frame: CGRectMake(0, pCalPosition, 370, pGraphHeight))
       itemViewScrollView.addSubview(calenderView)
        
        self.view.addSubview(itemViewScrollView)
        
       // 購入グラフ&カレンダーを　UIScrollViewにadd
     //  self.view.addSubview(pScrollView)
    }
    
    
    
    
    
    
    
    // navigationBarの高さ取得
    func navigationBarHeight(callFrom: UIViewController) -> CGFloat? {
        return callFrom.navigationController?.navigationBar.frame.size.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    Badgeのタップイベント
    */
    internal func tapGesture(sender: UITapGestureRecognizer){
        println("tapped Badge")
        println(clickAward?.awardid)
        let awardViewController: UIViewController = AwardViewController()
        navigationController?.pushViewController(awardViewController, animated: true)
    }
    
    // 認定バッジクリック時にクリックされたバッジを特定する
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // テストのため、仮想認定バッジ配列を準備
        var touch = touches.first as! UITouch
        var tag:Int = touch.view.tag
        clickAward = awards[tag]
        println("Calltouches")
    }
    
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
             println("Calltouches2")
        }
    }
    
}
