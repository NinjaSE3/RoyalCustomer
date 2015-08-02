//
//  LineDraw.swift
//  RoyalCustomer
//
//  Created by Rio NISHIDA on 8/1/15.
//  Copyright (c) 2015 NRI. All rights reserved.
//

import UIKit

class LineDraw: UIView {

    override func drawRect(rect: CGRect) {
        
        // UIBezierPath のインスタンス生成
        var line = UIBezierPath();
        
        // 起点
        line.moveToPoint(CGPointMake(0, 350));
        
        // 帰着点
        line.addLineToPoint(CGPointMake(350,350));
        
        // 色の設定
        UIColor.redColor().setStroke()
        
        // ライン幅
        line.lineWidth = 2
        
        // 描画
        line.stroke();
        
    }

}
