//
//  AwardViewController.swift
//  RoyalCustomer
//
//  Created by 林田 敦 on 2015/07/30.
//  Copyright (c) 2015年 NRI. All rights reserved.
//
//
//  ItemListViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class AwardViewController: UIViewController {
    
    // スクロールビュー
    //private var scrView = MyScrollView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.awardImageView()
        self.awardDetailView()
        self.awardShareView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func awardImageView(){
        // 認定イメージを表示
        
    }
    
    func awardDetailView(){
        // 認定説明文を表示
        
    }
    
    func awardShareView(){
        // シェアボタンを表示
        
    }
    
    
    /*
    // シェアボタンクリック時にシェア画面に遷移する
    func onClickAwardShareView(recognizer: UIGestureRecognizer) {
        println("test")
        let itemViewController: UIViewController = ItemViewController()
        navigationController?.pushViewController(itemViewController, animated: true)
    }
    */
    
    /*
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
        }
    }
    */
}
