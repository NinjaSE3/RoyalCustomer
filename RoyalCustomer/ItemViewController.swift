//
//  ItemViewController.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    // 変数定義
    private var shohinImageView: UIImageView!
    private var badgeImageView:  UIImageView!
    
    // TestDate
    var items :[UInt] = [10,35,18, 20, 50, 5]
    
    // Viewに関する情報取得
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height

    override func viewDidLoad() {
        let baf:            CGFloat = 10
        let bafBadge:       CGFloat = 5
        let navBarHeight:   CGFloat = self.navigationController!.navigationBar.bounds.size.height
        let shohinHeight:   CGFloat = 200
        let shohinWidth:    CGFloat  = 200
        let bLabelPosition: CGFloat = navBarHeight + shohinHeight + baf
        let bLabText:       String = "取得した認定バッジ"
        let badgeHeight:    CGFloat = 50
        let badgeWidth:     CGFloat = 50
        let badgePosiY:     CGFloat = bLabelPosition + baf
        
        // 表示する商品画像を設定　TODO:商品一覧から受け取ったURLを設定
        let shohinUrl = NSURL(string:"http://www.7meal.jp/prd/044996/01250/04008427_01_00.jpg")
        let sReq = NSURLRequest(URL:shohinUrl!)
        
        //　表示するバッジ画像を設定　TODO:商品一覧から受け取ったURLを設定
        let badgeUrlStr: [String] = ["http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg","http://odagirist.net/icon/rank/1.png","http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg", "http://www.illustcatcher.com/detail_sean/object/img/medal_m.jpg"]
        
        
        
        super.viewDidLoad()
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        /* 商品画像の生成 */
        // 非同期検索＆表示
        NSURLConnection.sendAsynchronousRequest(sReq, queue:NSOperationQueue.mainQueue()){(res, data, err) in
            let shohinImage = UIImage(data:data)
            
            // UIImageViewの生成 TODO：表示位置の動的設定
            let shohinImageView = UIImageView(image:shohinImage)
            shohinImageView.frame = CGRectMake(0, navBarHeight, shohinHeight, shohinWidth)
            self.view.addSubview(shohinImageView)
        }
        
        /* 認定バッジの生成 */
        // ラベル説明用ラベル表示
        let bLabel: UILabel = UILabel(frame: CGRectMake(0,bLabelPosition,200,50))
        bLabel.backgroundColor = UIColor.whiteColor()
        bLabel.text = bLabText
        bLabel.font = UIFont(name: "HiraKakuProN-W3", size: 16)
        bLabel.layer.position = CGPoint(x: self.view.bounds.width/4,y: bLabelPosition)
        bLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(bLabel)
        
        // ラベル取得＆表示
        var badgePosiX: CGFloat = 0
        for url in badgeUrlStr {

            var badgeNsurl = NSURL(string: url)
            var bReq = NSURLRequest(URL:badgeNsurl!)
            
            // 非同期検索＆表示
            NSURLConnection.sendAsynchronousRequest(bReq, queue:NSOperationQueue.mainQueue()){(res, data, err) in
                
                var badgeImage = UIImage(data:data)
                
                // UIImageViewの生成 TODO：表示位置の動的設定
                var badgeImageView = UIImageView(image:badgeImage)
                badgeImageView.frame = CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth)
                self.view.addSubview(badgeImageView)
                badgePosiX = badgePosiX + badgeWidth + bafBadge
            }
        }

        
        /* 購入情報の生成 */
        
        var barChart = PNBarChart(frame: CGRectMake(0, 400.0, 320.0, 200.0))
        barChart.backgroundColor = UIColor.clearColor()
        //            barChart.yLabelFormatter = ({(yValue: CGFloat) -> NSString in
        //                var yValueParsed:CGFloat = yValue
        //                var labelText:NSString = NSString(format:"%1.f",yValueParsed)
        //                return labelText;
        //            })
        
        
        // remove for default animation (all bars animate at once)
      //  barChart.animationType = .Waterfall
        
        
        barChart.labelMarginTop = 5.0
        barChart.xLabels = ["SEP 1","SEP 2","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7"]
        barChart.yValues = [1,24,12,18,30,10,21]
        barChart.strokeChart()
        
       // barChart.delegate = self
        
        self.view.addSubview(barChart)
        
    }
        
        // カレンダー表示
//        var calenderView:CalenderView = CalenderView(frame: CGRectMake(0, 20,
//            UIScreen.mainScreen().bounds.size.width, 500));
//        self.view.addSubview(calenderView)
        
        // create graph
        
        
    // navigationBarの高さ取得
    func navigationBarHeight(callFrom: UIViewController) -> CGFloat? {
        return callFrom.navigationController?.navigationBar.frame.size.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
