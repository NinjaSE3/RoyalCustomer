//
//  CommonClass.swift
//  RoyalCustomer
//
//  Created by 林田 敦 on 2015/07/30.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import Foundation

class Item {
    var itemid :String
    var name   :NSString
    var image  :String
    
    // イニシャライザ
    init(itemid: String, name: NSString, image: String) {
        self.itemid = itemid
        self.name   = name
        self.image  = image
    }
}