//
//  Message.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import Foundation.NSDate

class Message {
    let incoming: Bool
    let text: String
    let sentDate: NSDate
    
    init(incoming: Bool, text: String, sentDate: NSDate) {
        self.incoming = incoming
        self.text = text
        self.sentDate = sentDate
    }
}
