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
        
        // TODO 当日ならハイライト
        
        // TODO　購入ありならハイライト
        
        self.addSubview(dayLabel)
    }
}
