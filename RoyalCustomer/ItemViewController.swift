//
//  ItemViewController.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    // Viewに関する変数定義
    private var shohinImageView: UIImageView!
    private var brandImageView:  UIImageView!
    private var badgeImageView:  UIImageView!
    private var itemViewScrollView: UIScrollView!
    private var pScrollView:     UIScrollView!
    
    // Viewに関する情報取得
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height

    override func viewDidLoad() {
        let baf:            CGFloat = 10
        let bafBadge:       CGFloat = 5
        let navBarHeight:   CGFloat = self.navigationController!.navigationBar.bounds.size.height
        let shohinHeight:   CGFloat = 250
        let shohinWidth:    CGFloat = 200
        let brandHeight:    CGFloat = 50
        let brandWidth:     CGFloat = 50
        
        let bLabelPosition: CGFloat = navBarHeight + shohinHeight + baf
        let bLabText:       String = "取得した認定バッジ&トロフィー"
        let pLabText:       String = "商品購入数"
        let badgeHeight:    CGFloat = 50
        let badgeWidth:     CGFloat = 50
        let badgePosiY:     CGFloat = bLabelPosition + baf
        let pLabelPosition: CGFloat = badgePosiY + badgeHeight + baf
        let pGraphPosition: CGFloat = pLabelPosition
        
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
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 商品詳細View表示用UIScrollView作成
        itemViewScrollView = UIScrollView(frame: self.view.bounds)
        itemViewScrollView.backgroundColor = UIColor.clearColor()
        
        println(self.view.bounds.height)
        
        itemViewScrollView.pagingEnabled = false
        itemViewScrollView.bounces = true
        itemViewScrollView.scrollEnabled = true
        itemViewScrollView.directionalLockEnabled = false
        itemViewScrollView.showsHorizontalScrollIndicator = true
        itemViewScrollView.showsVerticalScrollIndicator = true
        
        
        // 購入グラフ&カレンダーを　UIScrollViewにadd
        self.view.addSubview(itemViewScrollView)
        
        
        // 商品画像の表示（ユーザーテスト用）
        let shohinImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, shohinHeight))
        let shohinImage = UIImage(named: clickItem!.image)
        shohinImageView.image = shohinImage

        // 縦横比保持 TODO:画像のサイズ調整
        //  shohinImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        itemViewScrollView.addSubview(shohinImageView)
        
        // ブランドロゴ付与
        let brandImageView = UIImageView(frame: CGRectMake(10, shohinHeight - shohinHeight/4, brandWidth, brandHeight))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
        itemViewScrollView.addSubview(brandImageView)
        
        /* 認定バッジの生成 */
        // ラベル説明用ラベル表示
        let bLabel: UILabel = UILabel(frame: CGRectMake(0,bLabelPosition,200,50))
        bLabel.backgroundColor = UIColor.whiteColor()
        bLabel.text = bLabText
        bLabel.font = UIFont(name: "HiraKakuProN-W3", size: 16)
        bLabel.layer.position = CGPoint(x: self.view.bounds.width/4,y: bLabelPosition)
        bLabel.textAlignment = NSTextAlignment.Center
        itemViewScrollView.addSubview(bLabel)
        
        // ラベル取得＆表示
        var badgePosiX: CGFloat = 0
        var i = 0
//        for url in badgeUrlStr {
//
//            var badgeNsurl = NSURL(string: url)
//            var bReq = NSURLRequest(URL:badgeNsurl!)
//            
//            // 非同期検索＆表示
//            NSURLConnection.sendAsynchronousRequest(bReq, queue:NSOperationQueue.mainQueue()){(res, data, err) in
//                
//                var badgeImage = UIImage(data:data)
//                
//                // UIImageViewの生成 TODO：表示位置の動的設定
//                var badgeImageView = UIImageView(image:badgeImage)
//                badgeImageView.frame = CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth)
//                badgeImageView.userInteractionEnabled = true
//                
//                // タップを認識.
//                let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
//                badgeImageView.addGestureRecognizer(badgeImageTap)
//                self.view.addSubview(badgeImageView)
//                badgePosiX = badgePosiX + badgeWidth + bafBadge
//                
//                // タグ（＝認定バッジ配列の要素番号）を設定
//                badgeImageView.tag = i
//                i++
//            }
//        }
        
        // 認定バッジ生成（ユーザーテスト用）
        for aNum in clickItem!.award1 {
            let badgeImagStr: String = awards[Int(aNum)].image
            var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth))
            let badgeImage = UIImage(named: badgeImagStr)
            badgeImageView.image = badgeImage
            // タップを認識.
            badgeImageView.userInteractionEnabled = true
            let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
            badgeImageView.addGestureRecognizer(badgeImageTap)
            self.view.addSubview(badgeImageView)
            badgePosiX = badgePosiX + badgeWidth + bafBadge
            badgeImageView.tag = Int(aNum)
        }
        
        for aNum in clickItem!.award2 {
            let badgeImagStr: String = awards[Int(aNum)].image
            var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth))
            let badgeImage = UIImage(named: badgeImagStr)
            badgeImageView.image = badgeImage
            // タップを認識.
            badgeImageView.userInteractionEnabled = true
            let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
            badgeImageView.addGestureRecognizer(badgeImageTap)
            self.view.addSubview(badgeImageView)
            badgePosiX = badgePosiX + badgeWidth + bafBadge
            badgeImageView.tag = Int(aNum)
        }
        
        
        /* 購入情報の生成 */
        // 購入情報説明用ラベル表示
        let pLabel: UILabel = UILabel(frame: CGRectMake(0,pLabelPosition,200,50))
        pLabel.backgroundColor = UIColor.whiteColor()
        pLabel.text = pLabText
        pLabel.font = UIFont(name: "HiraKakuProN-W3", size: 16)
        pLabel.layer.position = CGPoint(x: self.view.bounds.width/4,y: pLabelPosition)
        pLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(pLabel)
        
        // 購入グラフ&カレンダー表示用UIScrollView作成
        pScrollView = UIScrollView(frame: self.view.bounds)
        pScrollView.frame = CGRectMake(0, pGraphPosition, 350, 250)
        pScrollView.backgroundColor = UIColor.clearColor()
        println(self.view.bounds.height)
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
        var barChart = PNBarChart(frame: CGRectMake(0, 0, 350.0, 250.0))
        barChart.backgroundColor = UIColor.clearColor()
        
        //            barChart.yLabelFormatter = ({(yValue: CGFloat) -> NSString in
        //                var yValueParsed:CGFloat = yValue
        //                var labelText:NSString = NSString(format:"%1.f",yValueParsed)
        //                return labelText;
        //            })
        
        
        // remove for default animation (all bars animate at once)
        //  barChart.animationType = .Waterfall
        
        barChart.labelMarginTop = 5.0
        barChart.xLabels = prchedDateArray
        barChart.yValues = prchedNumArray
        barChart.strokeColor = primaryColor
        barChart.showLabel = false
        barChart.strokeChart()
        
       // barChart.delegate = self
       pScrollView.addSubview(barChart)

        
       // カレンダー表示
       var calenderView:CalenderView = CalenderView(frame: CGRectMake(350, 0, 350, 250))
       pScrollView.addSubview(calenderView)
        
       // 購入グラフ&カレンダーを　UIScrollViewにadd
       self.view.addSubview(pScrollView)
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
    }
    
    
}
