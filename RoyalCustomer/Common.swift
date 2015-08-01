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


class Item {
    var itemid :String
    var name   :NSString
    var image  :String
    var award1 :[Float]
    var award2 :[Float]
    
    // イニシャライザ
    init(itemid: String, name: NSString, image: String, award1: [Float], award2: [Float]) {
        self.itemid = itemid
        self.name   = name
        self.image  = image
        self.award1 = award1
        self.award2 = award2
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
    
    // イニシャライザ
    init(awardid: Float, level: Float, name: NSString, image: String, title: NSString, body: NSString, from: NSString) {
        self.awardid = awardid
        self.level   = level
        self.name   = name
        self.image  = image
        self.title = title
        self.body = body
        self.from = from
    }
}