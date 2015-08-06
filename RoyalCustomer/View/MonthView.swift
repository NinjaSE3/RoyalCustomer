//
//  CalenderView.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit

class MonthView: UIView {

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,year:Int,month:Int) {
        super.init(frame:frame)
        self.setUpDays(year,month:month)
    }

    func setUpDays(year:Int,month:Int){
        
        var subViews:[UIView] = self.subviews as! [UIView]
        //for view in subViews {
        //    if view.isKindOfClass(DayView) {
        //        view.removeFromSuperview()
        //    }
        //}
        
        var day:Int? = self.getLastDay(year,month:month);
        var dayWidth:Int = Int( frame.size.width / 7.0 )
        var dayHeight:Int = 25
        if day != nil {
            
            // ヘッダ行の設定
            
            let headTxt:[String] = ["日","月","火","水","木","金","土"]
            var headDay = 1
            for var i:Int = 0; i < 7;i++ {

                var x:Int       = ((headDay - 1 ) * (dayWidth));
                var dayLabel:UILabel = UILabel(frame: CGRectMake(CGFloat(x), 0, CGFloat(dayWidth),CGFloat(dayHeight)))
                dayLabel.textAlignment = NSTextAlignment.Center
                dayLabel.text = headTxt[i]
                dayLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
                self.addSubview(dayLabel)
                headDay++
                }
            
            //初日の曜日を取得
            var weekday:Int = self.getWeekDay(year,month: month,day:1)
            for var i:Int = 0; i < day!;i++ {
                var week:Int    = self.getWeek(year,month: month,day:i+1)
                var x:Int       = ((weekday - 1 ) * (dayWidth));
                var y:Int       = (week) * dayHeight
                var frame:CGRect = CGRectMake(CGFloat(x),
                    CGFloat(y),
                    CGFloat(dayWidth),
                    CGFloat(dayHeight)
                );
                
                var dayView:DayView = DayView(frame: frame, year:year,month:month,day:i+1,weekday:weekday)
                self.addSubview(dayView)
                
                weekday++
                if weekday > 7 {
                    weekday = 1
                }
                
            }
        }
    }
    
    //その月の最終日の取得
    func getLastDay(var year:Int,var month:Int) -> Int?{
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        if month == 12 {
            month = 0
            year++
        }
        var targetDate:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/01",year,month+1));
        if targetDate != nil {
            //月初から一日前を計算し、月末の日付を取得
            var orgDate = NSDate(timeInterval:(24*60*60)*(-1), sinceDate: targetDate!)
            var str:String = dateFormatter.stringFromDate(orgDate)
            //lastPathComponentを利用するのは目的として違う気も。。
            return str.lastPathComponent.toInt();
        }
        
        return nil;
    }
    
    //曜日の取得
    func getWeek(year:Int,month:Int,day:Int) ->Int{
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var date:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/%02d",year,month,day));
        if date != nil {
            var calendar:NSCalendar = NSCalendar.currentCalendar()
            var dateComp:NSDateComponents = calendar.components(NSCalendarUnit.WeekOfMonthCalendarUnit, fromDate: date!)
            return dateComp.weekOfMonth;
        }
        return 0;
    }
   
    //第何週の取得
    func getWeekDay(year:Int,month:Int,day:Int) ->Int{
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var date:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/%02d",year,month,day));
        if date != nil {
            var calendar:NSCalendar = NSCalendar.currentCalendar()
            var dateComp:NSDateComponents = calendar.components(NSCalendarUnit.WeekdayCalendarUnit, fromDate: date!)
            return dateComp.weekday;
        }
        return 0;
    }
    

}
