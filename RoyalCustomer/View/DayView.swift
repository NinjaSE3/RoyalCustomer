//
//  DayView.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit


class DayView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame:CGRect,year:Int,month:Int,day:Int,weekday:Int){
        super.init(frame: frame)
        var dayWidth:Int = Int( (UIScreen.mainScreen().bounds.size.width) / 7.0 )
        var dayHeight:CGFloat = 30
        var dayLabel:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat(dayWidth),dayHeight))
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.text = String(format:"%02d", day)
        if weekday == 1 {
            //日曜日は赤
            dayLabel.textColor = UIColor.redColor()
        } else if weekday == 7 {
            //土曜日は青
            dayLabel.textColor = UIColor.blueColor()
        }
        
        // 当日ならハイライト
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var dateString:String = dateFormatter.stringFromDate(NSDate());
        var dates:[String] = dateString.componentsSeparatedByString("/")
        let currentYear  = dates[0].toInt()!
        let currentMonth = dates[1].toInt()!
        let currentDay   = dates[2].toInt()!
        
        if day == currentDay {
            dayLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
            dayLabel.layer.masksToBounds = true
            dayLabel.layer.cornerRadius = 17.0
            dayLabel.backgroundColor = UIColor.blueColor()
            dayLabel.textColor = UIColor.whiteColor()
        }
        
        // 購入ありならハイライト
        for (date,num) in clickItem!.prchedThisM {
            if day == date {
                if num <= 1 {
                    dayLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
                } else if num <= 2 {
                    dayLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
                    dayLabel.textColor = UIColor.orangeColor()
                } else {
                   // 何もしない
                }
            }
       }
        
       self.addSubview(dayLabel)
    }
}