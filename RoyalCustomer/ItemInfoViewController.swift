//
//  ItemInfoViewController.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/08/04.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit
import SwiftCharts

class ItemInfoViewController: UIViewController{

    // View定義
    var itemViewScrollView = MyScrollView()
    var myWebView : UIWebView!
    
    // SwiftChart定義
    private var chart: Chart?  //arc
    
    // Viewに関する情報取得
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    
    // itemtabボタン
    var itemTabLeft:UIButton!
    var itemTabRight:UIButton!
    var calenderView :CalenderView!


    // 素材の高さ、幅
    let shohinHeight:   CGFloat = 180
    let shohinWidth:    CGFloat = 200
    let pButtonHeight:  CGFloat = 25
    let sOutlineHeight: CGFloat = 50
    let brandHeight:    CGFloat = 50
    let brandWidth:     CGFloat = 50
    let badgeTxtHeight: CGFloat = 15
    let badgeHeight:    CGFloat = 50
    let badgeWidth:     CGFloat = 50
    let pGraphHeight:   CGFloat = 250
    let pGraphWidth:    CGFloat = 350
    let pCalHeight:     CGFloat = 180
    let pCalWidth:      CGFloat = 350
    
    let itemTabHight:   CGFloat = 60
    let itemHeight:     CGFloat = 180
    let itemWidth:      CGFloat = 200
    
    // 素材のポジション
    var pCalPosiY:      CGFloat = 0
    
    private var pScrollView:     UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // ナビゲーションバーに商品名を表示
        //var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        title.textColor = primaryBackgroundColor
        //title.backgroundColor = UIColor.redColor()
        title.text = clickItem!.name as String
        title.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = title
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = primaryBackgroundColor
        
        // itemtabボタン
        self.itemTabView()
        
        // スクロールビューを追加
        self.addScrollView()
    }
    
    func itemTabView(){
        itemTabLeft = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: itemTabHight))
        itemTabRight = UIButton(frame: CGRect(x: self.view.frame.width/2, y: 0, width: self.view.frame.width/2, height: itemTabHight))
        
        itemTabLeft.backgroundColor=secondaryBackgroundColor
        itemTabLeft.layer.masksToBounds = true
        itemTabLeft.setTitle("購買履歴" , forState: .Normal)
        itemTabLeft.setTitleColor(primaryColor, forState: .Normal)
        itemTabLeft.titleLabel!.font = UIFont(name: fontName, size: 18)
        itemTabLeft.layer.position = CGPoint(x: self.itemTabLeft.frame.width/2, y:ViewManager.navigationBarHeight(self) + ViewManager.statusBarHeight + itemTabHight/2)
        itemTabLeft.imageView?.layer.borderColor = secondaryBackgroundColor.CGColor
        itemTabLeft.imageView?.layer.borderWidth = 5
        itemTabLeft.addTarget(self, action: "onClickLeftButton:", forControlEvents: .TouchUpInside)

        self.view.addSubview(itemTabLeft)

        itemTabRight.backgroundColor=secondaryBackgroundColor
        itemTabRight.layer.masksToBounds = true
        itemTabRight.setTitle("商品情報" , forState: .Normal)
        itemTabRight.setTitleColor(secondaryTextColor, forState: .Normal)
        itemTabRight.titleLabel!.font = UIFont(name: fontName, size: 18)
        itemTabRight.layer.position = CGPoint(x: self.itemTabLeft.frame.width + self.itemTabRight.frame.width/2, y:ViewManager.navigationBarHeight(self) + ViewManager.statusBarHeight + itemTabHight/2)
        itemTabRight.imageView?.layer.borderColor = secondaryBackgroundColor.CGColor
        itemTabRight.imageView?.layer.borderWidth = 5
        itemTabRight.addTarget(self, action: "onClickRightButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(itemTabRight)
        
        // 最初は購買履歴画面を表示
        self.onClickLeftButton(itemTabLeft)

    }
    
    func onClickLeftButton(sender: UIButton){
        // タブの文字色を変更
        self.itemTabRight.setTitleColor(secondaryTextColor, forState: .Normal)
        self.itemTabLeft.setTitleColor(primaryColor, forState: .Normal)
        
        
        // タブページを初期化
        self.resetTabPage()
        

        
        // 素材の位置
        let baf:            CGFloat = 10 //　素材間のバッファ
        let bafBadge:       CGFloat = 5  //　バッジ間のバッファ
        let pLabelPosition: CGFloat = shohinHeight                              //「商品購入数」ラベルの位置
        let pGraphPosition: CGFloat = pLabelPosition + pButtonHeight + baf      // 購入累積グラフ表示位置
        let bLabelPosition: CGFloat = pGraphPosition + pGraphHeight             //「取得した認定バッジ」ラベルの位置
        let badgePosiY:     CGFloat = bLabelPosition + badgeTxtHeight + baf     //　認定バッジ表示位置
        let badgeNumPosiY:  CGFloat = bLabelPosition + badgeTxtHeight + bafBadge // 認定バッジの右上の数字表示位置
        let pCalLabelPosition: CGFloat = badgePosiY + badgeHeight + baf         // 「商品購入日」ラベルの位置
        let pButtonThisMPosiY: CGFloat = pCalLabelPosition + pButtonHeight + baf    // カレンダー年月ラベル表示位置
        let pCalPosition:   CGFloat = pButtonThisMPosiY + badgeTxtHeight + baf      //　カレンダー表示位置
        let bTrpLabelPosition: CGFloat = pCalPosition + pCalHeight + bafBadge       // 「取得した認定トロフィー」ラベルの位置
        let badgeTrpPosiY:     CGFloat = bTrpLabelPosition + badgeTxtHeight + baf     //　認定トロフィー表示位置
        let badgeTrpNumPosiY:  CGFloat = bTrpLabelPosition + badgeTxtHeight + bafBadge // 認定トロフィーの右上の数字表示位置
        let txtArePosiX: CGFloat = 20
        
        pCalPosiY = pCalPosition
        
        // 素材文言
        let bLabText:       String = "取得した認定バッジ"
        let bNoLabText:     String = "取得したバッジ＆トロフィーはありません。"
        let bLabTrpText:    String = "取得した認定トロフィー"
        let pLabText1:       String = "商品購入数"
        let pLabText2:       String = "商品購入日"
        let pCalLabText:    String = "当月購入カレンダー"
        
        // 購買情報
        var prchedDateArray :[String] = []
        var prchedNumArray :[CGFloat] = []
        var prchedGrpDict: [String: CGFloat] = [:]
        var prchedLGrpDict: [String: CGFloat] = [:]
        
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
        //            shohinImageView.frame = CGRectMake(0, ViewManager.navigationBarHeight(self), shohinHeight, shohinWidth)
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
        //itemViewScrollView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        // タッチイベントを即時取得
        itemViewScrollView.delaysContentTouches = false
        itemViewScrollView.backgroundColor = UIColor.clearColor()
        itemViewScrollView.pagingEnabled = false
        itemViewScrollView.bounces = true
        itemViewScrollView.scrollEnabled = true
        itemViewScrollView.directionalLockEnabled = false
        itemViewScrollView.showsHorizontalScrollIndicator = true
        itemViewScrollView.showsVerticalScrollIndicator = false
        itemViewScrollView.contentSize = CGSizeMake(self.view.bounds.width, self.view.bounds.height * 1.6)
        self.view.addSubview(itemViewScrollView)
        
        
        // 商品画像の表示（ユーザーテスト用）
        let shohinImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, shohinHeight)) // UIScrollview内での位置設定であることに注意
        let shohinImage = UIImage(named: clickItem!.image)
        shohinImageView.image = shohinImage
        
        // 縦横比保持 TODO:画像のサイズ調整
        //        shohinImageView.contentMode = UIViewContentMode.ScaleAspectFill
        //        shohinImageView.contentMode = UIViewContentMode.Top
        shohinImageView.contentMode = UIViewContentMode.Center
        shohinImageView.clipsToBounds = true
        itemViewScrollView.addSubview(shohinImageView)
        
        // ブランドロゴ付与
        let brandImageView = UIImageView(frame: CGRectMake(10, shohinHeight - shohinHeight/3.0, brandWidth, brandHeight))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        brandImageView.layer.cornerRadius = brandImageView.frame.size.width / 2.0
        brandImageView.clipsToBounds = true
        brandImageView.layer.borderColor = primaryColor.CGColor
        brandImageView.layer.borderWidth = 2
        brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
        itemViewScrollView.addSubview(brandImageView)
        
//        // 商品説明のset
//        let shohinOutline: UIButton = UIButton(frame: CGRectMake(txtArePosiX,shohinOutlinePosition,self.view.bounds.width,sOutlineHeight))
//        shohinOutline.setTitle(clickItem!.outline, forState: UIControlState.Normal)
//        shohinOutline.titleLabel!.font = UIFont(name: fontName, size: 12)
//        shohinOutline.titleLabel!.numberOfLines = 3
//        shohinOutline.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        shohinOutline.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
//        itemViewScrollView.addSubview(shohinOutline)
//        
//        // 仕切り線設定
//        let lineUIImageView = UIImageView(frame: CGRectMake(0, linePosition, self.view.bounds.width, 5))
//        let lineImage = UIImage(named: "line1")
//        lineUIImageView.image = lineImage
//        itemViewScrollView.addSubview(lineUIImageView)
        
        
        /* 購入情報の生成 */
        // 購入情報説明用ラベル表示
        let pButton: UIButton = UIButton(frame: CGRectMake(0,pLabelPosition, self.view.bounds.width,pButtonHeight))
        pButton.setTitle(pLabText1, forState: UIControlState.Normal)
        pButton.backgroundColor = primaryColor
        pButton.titleLabel!.font = UIFont(name: fontName, size: 14)
        pButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
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
                    var str: String = dates[1]+"月"
                    prchedGrpDict[str] = num
                }
            }
        }
        
        // 購入グラフ表示
        let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        var barsData: [(title: String, min: CGFloat, max: CGFloat)] = []
        // LineDataの定義
        var lineData: [(title: String, val: CGFloat)] = []
        var tmpMax: CGFloat = 0
        var yValMax: CGFloat = 0
        
        
        // 購入情報の取り出し
        var keys2 = Array(prchedGrpDict.keys)
        // keysを昇順でソートする
        keys2.sort({
            $0 < $1
        })
        
        for sortKey in keys2 {
            for (key,value) in prchedGrpDict {
                if sortKey == key {
                    tmpMax = tmpMax + value
                    barsData.append((title: key, min: CGFloat(0), max: value))
                    lineData.append((title: key, val: CGFloat(tmpMax)))
                    yValMax = ceil(tmpMax * 1.3)
                }
            }
        }
        
        let grpBy : CGFloat = ceil(yValMax / 5)
        
        let alpha: CGFloat = 0.5
        //        let posColor = UIColor.greenColor().colorWithAlphaComponent(alpha)
        let posColor = primaryColor
        let negColor = UIColor.redColor().colorWithAlphaComponent(alpha)
        let zero = ChartAxisValueFloat(0)
        let bars: [ChartBarModel] = Array(enumerate(barsData)).flatMap {index, tuple in
            [
                ChartBarModel(constant: ChartAxisValueFloat(CGFloat(index)), axisValue1: zero, axisValue2: ChartAxisValueFloat(tuple.min), bgColor: negColor),
                ChartBarModel(constant: ChartAxisValueFloat(CGFloat(index)), axisValue1: zero, axisValue2: ChartAxisValueFloat(tuple.max), bgColor: posColor)
            ]
        }
        
        let yValues = Array(stride(from: 0, through: yValMax, by: grpBy)).map {ChartAxisValueFloat($0, labelSettings: labelSettings)}
        let xValues =
        [ChartAxisValueString(order: -1)] +
            Array(enumerate(barsData)).map {index, tuple in ChartAxisValueString(tuple.0, order: index, labelSettings: labelSettings)} +
            [ChartAxisValueString(order: barsData.count)]
        
        
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "", settings: labelSettings.defaultVertical()))
        let chartFrame = CGRectMake(0, pGraphPosition, pGraphWidth, pGraphHeight)
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: ExamplesDefaults.chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
        
        let barsLayer = ChartBarsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, bars: bars, horizontal: false, barWidth: Env.iPad ? 40 : 25, animDuration: 0.5)
        
        // labels layer
        // create chartpoints for the top and bottom of the bars, where we will show the labels
                let labelChartPoints = bars.map {bar in
                    ChartPoint(x: bar.constant, y: bar.axisValue2)
                }
                let formatter = NSNumberFormatter()
                formatter.maximumFractionDigits = 2
                let labelsLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: labelChartPoints, viewGenerator: {(chartPointModel, layer, chart) -> UIView? in
                    let label = HandlingLabel()
                    let posOffset: CGFloat = 10
        
                    let pos = chartPointModel.chartPoint.y.scalar > 1
        
                    let yOffset = pos ? -posOffset : posOffset
                    label.text = "\(formatter.stringFromNumber(chartPointModel.chartPoint.y.scalar)!)"
                    label.font = ExamplesDefaults.labelFont
                    label.sizeToFit()
                    label.center = CGPointMake(chartPointModel.screenLoc.x, pos ? innerFrame.origin.y : innerFrame.origin.y + innerFrame.size.height)
                    label.alpha = 0
        
                    label.movedToSuperViewHandler = {[weak label] in
                        UIView.animateWithDuration(0.3, animations: {
                            label?.alpha = 1
                            label?.center.y = chartPointModel.screenLoc.y + yOffset
                        })
                    }
                    if label.text == "0" {
                        let tmpLabel : UIView = UIView()
                            return tmpLabel
                        } else {
                            return label
                        }
                    }, displayDelay: 0.5) // show after bars animation
        
        // line layer
        let lineChartPoints = Array(enumerate(lineData)).map {index, tuple in ChartPoint(x: ChartAxisValueFloat(CGFloat(index)), y: ChartAxisValueFloat(tuple.val))}
        let lineModel = ChartLineModel(chartPoints: lineChartPoints, lineColor: primaryColor, lineWidth: 2, animDuration: 0.5, animDelay: 1)
        let lineLayer = ChartPointsLineLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, lineModels: [lineModel])
        
        let circleViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
            let color = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
            let circleView = ChartPointEllipseView(center: chartPointModel.screenLoc, diameter: 6)
            circleView.animDuration = 0.5
            circleView.fillColor = color
            return circleView
        }
        let lineCirclesLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: lineChartPoints, viewGenerator: circleViewGenerator, displayDelay: 1.5, delayBetweenItems: 0.05)
        
        
        // show a gap between positive and negative bar
        let dummyZeroYChartPoint = ChartPoint(x: ChartAxisValueFloat(0), y: ChartAxisValueFloat(0))
        let yZeroGapLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: [dummyZeroYChartPoint], viewGenerator: {(chartPointModel, layer, chart) -> UIView? in
            let height: CGFloat = 2
            let v = UIView(frame: CGRectMake(innerFrame.origin.x + 2, chartPointModel.screenLoc.y - height / 2, innerFrame.origin.x + innerFrame.size.height, height))
            v.backgroundColor = UIColor.whiteColor()
            return v
        })
        
        // guideLinesLayer定義
        var settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.blackColor(), linesWidth: ExamplesDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: settings)
        
        
        let chart = Chart(
            frame: chartFrame,
            layers: [
                xAxis,
                yAxis,
                barsLayer,
                labelsLayer,
             //   yZeroGapLayer,
                lineLayer,
                lineCirclesLayer,
                guidelinesLayer
            ]
        )
        
        itemViewScrollView.addSubview(chart.view)
        //self.view.addSubview(itemViewScrollView)
        self.chart = chart
        
        
        /* 認定バッジの生成 */
        // 認定バッジ説明のset
        let bButton: UIButton = UIButton(frame: CGRectMake(txtArePosiX,bLabelPosition, self.view.bounds.width,badgeTxtHeight))
        bButton.setTitle(bLabText, forState: UIControlState.Normal)
        bButton.titleLabel!.font = UIFont(name: fontName, size: 12)
        bButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        bButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        itemViewScrollView.addSubview(bButton)
        
        // ラベル取得＆表示
        var badgePosiX: CGFloat = txtArePosiX
        
        // 認定バッジ生成（ユーザーテスト用）
        if clickItem!.award1.count == 0 {
            let bNoButton: UIButton = UIButton(frame: CGRectMake(badgePosiX,badgePosiY, self.view.bounds.width,badgeTxtHeight))
            bNoButton.setTitle(bNoLabText, forState: UIControlState.Normal)
            bNoButton.titleLabel!.font = UIFont(name: fontName, size: 11)
            bNoButton.setTitleColor(primaryColor, forState: UIControlState.Normal)
            bNoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            itemViewScrollView.addSubview(bNoButton)
        } else {
            for aNum in clickItem!.award1 {
                let badgeImagStr: String = awards[Int(aNum)].image
                var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgePosiY, badgeHeight, badgeWidth))
                let badgeImage = UIImage(named: badgeImagStr)
                badgeImageView.image = badgeImage
                badgeImageView.contentMode = UIViewContentMode.ScaleAspectFit
                badgeImageView.userInteractionEnabled = true //タップを認識させる
                let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
                badgeImageView.addGestureRecognizer(badgeImageTap)
                badgeImageView.tag = Int(aNum)
                itemViewScrollView.addSubview(badgeImageView)
                
                
                // バッジに付与する認定実績
                var badgeNum: UIButton = UIButton(frame: CGRectMake(badgePosiX+35, badgeNumPosiY, badgeHeight/3, badgeWidth/3))
                badgeNum.setTitle(String(awards[Int(aNum)].num), forState: UIControlState.Normal)
                badgeNum.titleLabel!.font = UIFont(name: fontName, size: 8)
                badgeNum.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                badgeNum.backgroundColor = UIColor.grayColor()
                badgeNum.layer.cornerRadius = badgeNum.layer.frame.size.width / 2.0
                itemViewScrollView.addSubview(badgeNum)
                
                badgePosiX = badgePosiX + badgeWidth + bafBadge
                
            }
        }
        
        // 認定トロフィー説明のset
        let bTrpButton: UIButton = UIButton(frame: CGRectMake(txtArePosiX,bTrpLabelPosition, self.view.bounds.width,badgeTxtHeight))
        bTrpButton.setTitle(bLabTrpText, forState: UIControlState.Normal)
        bTrpButton.titleLabel!.font = UIFont(name: fontName, size: 12)
        bTrpButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        bTrpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        itemViewScrollView.addSubview(bTrpButton)
        
        
        // 認定トロフィー表示用
        badgePosiX = txtArePosiX
        if clickItem!.award2.count == 0 {
            let bNoButton: UIButton = UIButton(frame: CGRectMake(badgePosiX,badgeTrpPosiY, self.view.bounds.width,badgeTxtHeight))
            bNoButton.setTitle(bNoLabText, forState: UIControlState.Normal)
            bNoButton.titleLabel!.font = UIFont(name: fontName, size: 11)
            bNoButton.setTitleColor(primaryColor, forState: UIControlState.Normal)
            bNoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            itemViewScrollView.addSubview(bNoButton)
        } else {
            for aNum in clickItem!.award2 {
                let badgeImagStr: String = awards[Int(aNum)].image
                var badgeImageView = UIImageView(frame: CGRectMake(badgePosiX, badgeTrpPosiY, badgeHeight, badgeWidth))
                let badgeImage = UIImage(named: badgeImagStr)
                badgeImageView.image = badgeImage
                badgeImageView.userInteractionEnabled = true
                badgeImageView.contentMode = UIViewContentMode.ScaleAspectFit
                let badgeImageTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
                badgeImageView.addGestureRecognizer(badgeImageTap)
                badgeImageView.tag = Int(aNum)
                itemViewScrollView.addSubview(badgeImageView)
                
                
                // バッジに付与する認定実績
                var badgeNum: UIButton = UIButton(frame: CGRectMake(badgePosiX+35, badgeTrpNumPosiY, badgeHeight/3, badgeWidth/3))
                badgeNum.setTitle(String(awards[Int(aNum)].num), forState: UIControlState.Normal)
                badgeNum.titleLabel!.font = UIFont(name: fontName, size: 8)
                badgeNum.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                badgeNum.backgroundColor = UIColor.grayColor()
                badgeNum.layer.cornerRadius = badgeNum.layer.frame.size.width / 2.0
                itemViewScrollView.addSubview(badgeNum)
                
                badgePosiX = badgePosiX + badgeWidth + bafBadge
                
            }
        }
        
        // カレンダー表示
        // 商品購入カレンダー説明ラベル
        let pCalButton: UIButton = UIButton(frame: CGRectMake(0,pCalLabelPosition, self.view.bounds.width,pButtonHeight))
        pCalButton.setTitle(pLabText2, forState: UIControlState.Normal)
        pCalButton.backgroundColor = primaryColor
        pCalButton.titleLabel!.font = UIFont(name: fontName, size: 14)
        pButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        itemViewScrollView.addSubview(pCalButton)
        
        
        // 当月購買詳細ラベル表示
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy年M月";
        var dateString:String = dateFormatter.stringFromDate(NSDate());
        let pCalTxt = dateString
        
        let pButtonThisM: UIButton = UIButton(frame: CGRectMake(0,pButtonThisMPosiY, self.view.bounds.width,badgeTxtHeight))
        pButtonThisM.setTitle(pCalTxt, forState: UIControlState.Normal)
        pButtonThisM.titleLabel!.font = UIFont(name: fontName, size: 13)
        pButtonThisM.setTitleColor(primaryColor, forState: UIControlState.Normal)
        itemViewScrollView.addSubview(pButtonThisM)
        
        // カレンダー表示
        var dateFormatter2:NSDateFormatter = NSDateFormatter();
        dateFormatter2.dateFormat = "yyyy/MM/dd";
        var dateString2:String = dateFormatter2.stringFromDate(NSDate());
        var dates2:[String] = dateString2.componentsSeparatedByString("/")
        
        var currentYear2:Int = 0
        var currentMonth2:Int = 0
        
        currentYear2  = dates2[0].toInt()!
        currentMonth2 = dates2[1].toInt()!
    
        let currentMonthView = MonthView(frame: CGRectMake(0, pCalPosition, pCalWidth,pCalHeight),
        year:currentYear2,month:currentMonth2)
        itemViewScrollView.addSubview(currentMonthView)
        
        // UIScrollView呼び出しでなく直接MonthView呼び出しに修正
//        calenderView = CalenderView(frame: CGRectMake(0, pCalPosition, pCalWidth, pCalHeight))
//        calenderView.backgroundColor = UIColor.redColor()
        
        // スクロール位置を先頭に
        itemViewScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    func onClickRightButton(sender: UIButton){
        
        
        // タブの文字色を変更
        self.itemTabRight.setTitleColor(primaryColor, forState: .Normal)
        self.itemTabLeft.setTitleColor(secondaryTextColor, forState: .Normal)
        
        // タブページを初期化
        self.resetTabPage()
        
        // 背景色をWhiteに設定する.
        self.view.backgroundColor = primaryBackgroundColor
        
        // スクロールビューを追加
        //self.addScrollView()
        itemViewScrollView.contentSize = CGSizeMake(self.view.bounds.width, self.view.bounds.height * 4 - self.navigationController!.navigationBar.bounds.size.height - UIApplication.sharedApplication().statusBarFrame.size.height )
        
        // 商品画像の表示（ユーザーテスト用）
        let itemImageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, itemHeight)) // UIScrollview内での位置設定であることに注意
        let iteminImage = UIImage(named: clickItem!.image)
        itemImageView.image = iteminImage
        itemImageView.contentMode = UIViewContentMode.Center
        itemImageView.clipsToBounds = true
        itemViewScrollView.addSubview(itemImageView)
        
        // ブランドロゴ付与
        let brandImageView = UIImageView(frame: CGRectMake(10, itemHeight - itemHeight/3.0, brandWidth, brandHeight))
        let brandImage = UIImage(named: clickItem!.brandImage)
        brandImageView.image = brandImage
        brandImageView.layer.cornerRadius = brandImageView.frame.size.width / 2.0
        brandImageView.clipsToBounds = true
        brandImageView.layer.borderColor = primaryColor.CGColor
        brandImageView.layer.borderWidth = 2
        brandImageView.contentMode = UIViewContentMode.ScaleAspectFit
        itemViewScrollView.addSubview(brandImageView)
        
        // webViewを生成.
        myWebView = UIWebView(frame: CGRectMake(0, itemHeight, self.view.bounds.width, self.view.bounds.height * 4 - itemHeight ))
        // ファイルパスを生成.
        let path: NSString!
        if(clickItem!.name == "森永の焼プリン"){
            path = NSBundle.mainBundle().pathForResource("morinaga", ofType:"html")!
        }else if(clickItem!.name == "コカ・コーラ"){
            path = NSBundle.mainBundle().pathForResource("cocacola", ofType:"html")!
        }else if(clickItem!.name == "お〜いお茶"){
            path = NSBundle.mainBundle().pathForResource("o-iocha", ofType:"html")!
        }else if(clickItem!.name == "セブンカフェ"){
            path = NSBundle.mainBundle().pathForResource("sevencafe", ofType:"html")!
        }else{
            path = NSBundle.mainBundle().pathForResource("commingsoon", ofType:"html")!
        }
        
        // requestを生成.
        let request:NSURLRequest = NSURLRequest(URL: NSURL.fileURLWithPath(path as String)!)
        // fullscreen表示ではなく、inline表示にする.
        myWebView.allowsInlineMediaPlayback = false
        // 自動的に再生を開始.
        myWebView.mediaPlaybackRequiresUserAction = false
        
        myWebView.scrollView.scrollEnabled = false
        // load開始.
        myWebView.loadRequest(request)
        itemViewScrollView.addSubview(myWebView)
        
        // スクロール位置を先頭に
        itemViewScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    func resetTabPage() {
        // タブページをリセット（中のsubviewを全消去）
        itemViewScrollView.subviews.map({ $0.removeFromSuperview() })
    }
    
    func addScrollView() {
        // 商品詳細View表示用UIScrollView作成
        itemViewScrollView.frame = CGRectMake(0, itemTabHight, view.bounds.width, view.bounds.height)
        itemViewScrollView.layer.position = CGPoint(
            x:view.bounds.width/2,
            y:view.bounds.height/2 + itemTabHight + ViewManager.statusBarHeight + ViewManager.navigationBarHeight(self)
        )
        // タッチイベントを即時取得
        itemViewScrollView.delaysContentTouches = false
        itemViewScrollView.backgroundColor = UIColor.clearColor()
        itemViewScrollView.pagingEnabled = false
        itemViewScrollView.bounces = true
        itemViewScrollView.scrollEnabled = true
        itemViewScrollView.directionalLockEnabled = false
        itemViewScrollView.showsHorizontalScrollIndicator = true
        itemViewScrollView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(itemViewScrollView)
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
    
    /*
    Badgeのタップイベント
    */
    internal func tapGesture(sender: UITapGestureRecognizer){
        println("tapped Badge")
        println(clickAward?.awardid)
        let awardViewController: UIViewController = AwardViewController()
        // アニメーションを設定する.
        awardViewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        
        // Viewの移動する.
        self.presentViewController(awardViewController, animated: true, completion: nil)
        
    }
    
    // 認定バッジクリック時にクリックされたバッジを特定する
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // テストのため、仮想認定バッジ配列を準備
        var touch = touches.first as! UITouch
        var tag:Int = touch.view.tag
        clickAward = awards[tag]
        println("Calltouches")
    }


}
