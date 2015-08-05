//
//  CommonClass.swift
//  RoyalCustomer
//
//  Created by 林田 敦 on 2015/07/30.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import Foundation


// 配色
var primaryTextColor:UIColor!
var secondaryTextColor:UIColor!
var primaryColor:UIColor!
var secondaryColor:UIColor!
var primaryBackgroundColor:UIColor!
var secondaryBackgroundColor:UIColor!
var primaryAwardColor:UIColor!
var secondaryAwardColor:UIColor!
var facebookColor:UIColor!

// フォント
var fontName:String!
var fontNameBold:String!


class Item {
    var itemid :String
    var name   :NSString
    var image  :String
    var award1 :[Float]
    var award2 :[Float]
    var prchedHist : [String: Int]  // "2015/7"(年月): 30（個数）
    var prchedThisM :[Int: Int]     // 19 (当月日付): 1（個数）
    var brandImage :String          //　ブランド画像名称
    var outline :String             // 商品概要
    
    // イニシャライザ
    init(itemid: String, name: NSString, image: String, award1: [Float], award2: [Float], prchedHist:[String: Int], prchedThisM:[Int: Int], brandImage: String, outline: String ) {
        self.itemid = itemid
        self.name   = name
        self.image  = image
        self.award1 = award1
        self.award2 = award2
        self.prchedHist = prchedHist
        self.prchedThisM = prchedThisM
        self.brandImage = brandImage
        self.outline = outline
    }
}

class Award {
    var awardid:Float
    var level  :Float
    var name   :NSString
    var image  :String
    var title  :NSString
    var body   :NSString
    var from   :NSString
    var num    :Int         //認定された累積数or連続購入日数
    
    // イニシャライザ
    init(awardid: Float, level: Float, name: NSString, image: String, title: NSString, body: NSString, from: NSString, num: Int) {
        self.awardid = awardid
        self.level   = level
        self.name   = name
        self.image  = image
        self.title = title
        self.body = body
        self.from = from
        self.num = num
    }
}

struct ViewManager {
    
    static let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
    
    static let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    
    static var currentWindow: UIWindow? {
        if let window = UIApplication.sharedApplication().keyWindow {
            return window
        } else {
            return UIApplication.sharedApplication().windows[0] as? UIWindow
        }
    }
    
    // デフォルトFloat(44)としてUnwrap
    static func navigationBarHeight(callFrom: UIViewController) -> CGFloat {
        return callFrom.navigationController?.navigationBar.frame.size.height ?? 44
    }
}