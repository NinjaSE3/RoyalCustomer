//
//  ItemViewController.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, CPTPlotDataSource {
    
    // 変数定義
    private var shohinImageView: UIImageView!
    var graphView: CPTGraphHostingView!
    
    // TestDate
    var items :[UInt] = [10,35,18, 20, 50, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        /* 商品画像の生成 */
        // 表示する画像を設定
        let url = NSURL(string:"http://www.7meal.jp/prd/044996/01250/04008427_01_00.jpg")
        let req = NSURLRequest(URL:url!)
        
        // 非同期検索＆表示
        NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
            let shohinImage = UIImage(data:data)
            
            // UIImageViewの生成 TODO：表示位置の動的設定
            let shohinImageView = UIImageView(image:shohinImage);
            shohinImageView.frame = CGRectMake(20, 30, 250, 250);
            self.view.addSubview(shohinImageView);
        }
        
        /* 認定バッジの生成 */
        
        
        
        
        /* 購入情報の生成 */
        // create graph
        
        // ホスティングビューのインスタンス生成 TODO:表示位置の動的設定
        graphView = CPTGraphHostingView(frame: CGRectMake(20, 330, 250, 250))
        
        // graphの生成とpraphViewへのホスト
        var graph = CPTXYGraph(frame: CGRectZero)
        self.graphView.hostedGraph = graph
        
        // graphの各種設定
        var CPDBarWidth:CGFloat = 0.25
        var CPDBarInitialX:CGFloat = 0.25
        
        
        // graph.title = "購買情報"
        graph.plotAreaFrame.masksToBorder = false
        graph.paddingLeft = 10
        graph.paddingTop = 10
        graph.paddingRight = 5
        graph.paddingBottom = 5
        graph.backgroundColor = UIColor.whiteColor().CGColor
        
        // titleの設定
        var titleStyle = CPTMutableTextStyle()
        titleStyle.color = CPTColor.blackColor()
        titleStyle.fontName = "Helvetica-Bold"
        titleStyle.fontSize = 15.0
        
        var title : NSString = "購買情報"
        graph.title = title as String
        graph.titleTextStyle = titleStyle
        graph.titleDisplacement = CGPointMake(0.0, 40.0)
        
        //        // グラフのプロット
        //        var barPlot = CPTBarPlot(frame: CGRectZero)
        //        barPlot.barsAreHorizontal = false
        //
        //        var barLineStyle = CPTMutableLineStyle()
        //
        //        barLineStyle.lineColor = CPTColor.lightGrayColor()
        //        barLineStyle.lineWidth = 1
        //
        //        barPlot.dataSource = self
        
        //        // CPTXYGraphに棒グラフ追加
        //        graph.addPlot(barPlot)
        
        
        //        var plot = CPTScatterPlot()
        //        plot.dataSource = self
        //        graph.addPlot(plot)
        
        // graphView描画
        self.view.addSubview(graphView)
        
        
    }
    
    /* 棒グラフのレコード数を返却
    CPTPlotDataSouceプロトコル対応*/
    func numberOfRecordsForPlot(plot: CPTPlot!) -> UInt {
        println(items)
        return UInt(items.count)
    }
    
    
    func numberForPlot(plot: CPTPlot!, field fieldEnum: UInt, recordIndex idx: UInt) -> UInt! {
        switch (fieldEnum) {
        case 0:
            if (idx < UInt(items.count)) {
                return idx + 1
            }
            break;
            
        case 1:
            return items[Int(idx)]
            
        default:
            
            return 1
            
        }
        
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
