//
//  CalenderView.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 7/30/15.
//  Copyright (c) 2015 NRI. All rights reserved.

import UIKit

class CalenderView: UIView,UIScrollViewDelegate{

    var currentYear:Int = 0
    var currentMonth:Int = 0
    var currentDay:Int = 0
    var scrollView:UIScrollView!
    var prevMonthView:MonthView!
    var currentMonthView:MonthView!
    var nextMonthView:MonthView!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        
        var dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        var dateString:String = dateFormatter.stringFromDate(NSDate());
        var dates:[String] = dateString.componentsSeparatedByString("/")
        currentYear  = dates[0].toInt()!
        currentMonth = dates[1].toInt()!
        
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize   = CGSizeMake(frame.size.width,frame.size.height);
        
        println(frame.size.height)
        println(frame.size.width)
        scrollView.contentOffset = CGPointMake(frame.size.width , 0.0);
        scrollView.delegate = self;
        scrollView.pagingEnabled = true;
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.scrollsToTop = false;
        self.addSubview(scrollView)
        
        
        currentMonthView = MonthView(frame: CGRectMake(frame.size.width + 25, 0, 300,250),
            year:currentYear,month:currentMonth)
        
        scrollView.addSubview(currentMonthView);

    }
    
    
    func resetContentOffSet () {
        //position調整
        prevMonthView.frame = CGRectMake(0, 0, frame.size.width,frame.size.height)
        currentMonthView.frame = CGRectMake(frame.size.width, 0, frame.size.width,frame.size.height)
        nextMonthView.frame = CGRectMake(frame.size.width * 2.0, 0, frame.size.width,frame.size.height)
        
        var scrollViewDelegate:UIScrollViewDelegate = scrollView.delegate!
        scrollView.delegate = nil
        //delegateを呼びたくないので
        scrollView.contentOffset = CGPointMake(frame.size.width , 0.0);
        scrollView.delegate = scrollViewDelegate
        
    }
    
}
