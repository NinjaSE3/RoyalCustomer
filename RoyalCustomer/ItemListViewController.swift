//
//  ItemListViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class Item {
    var itemid :String
    var image  :String
    var priority :Float
    
    // イニシャライザ
    init(itemid: String, image: String, priority: Float) {
        self.itemid = itemid
        self.image = image
        self.priority = priority
    }
}

class ItemListViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をGreenに設定する.
        self.view.backgroundColor = UIColor.greenColor()
        
        self.itemListView()
        
        // tabBarItemのアイコンをFeaturedに、タグを2と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 2)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func itemListView(){
        // 商品リスト
        let items = [
            Item(itemid:"test001",image:"img001.jpg",priority:1),
            Item(itemid:"test002",image:"img002.jpg",priority:1),
            Item(itemid:"test003",image:"img003.jpg",priority:2),
            Item(itemid:"test004",image:"img004.jpg",priority:2),
            Item(itemid:"test005",image:"img005.jpg",priority:2),
            Item(itemid:"test006",image:"img006.jpg",priority:2),
            Item(itemid:"test007",image:"img007.jpg",priority:2),
            Item(itemid:"test008",image:"img008.jpg",priority:3),
            Item(itemid:"test009",image:"img009.jpg",priority:3),
            Item(itemid:"test010",image:"img010.jpg",priority:3),
            Item(itemid:"test011",image:"img011.jpg",priority:3),
            Item(itemid:"test012",image:"img012.jpg",priority:3),
            Item(itemid:"test013",image:"img013.jpg",priority:3),
            Item(itemid:"test014",image:"img014.jpg",priority:3),
            Item(itemid:"test015",image:"img015.jpg",priority:3),
            Item(itemid:"test016",image:"img016.jpg",priority:3),
            Item(itemid:"test017",image:"img017.jpg",priority:3),
            Item(itemid:"test018",image:"img018.jpg",priority:3),
            Item(itemid:"test019",image:"img019.jpg",priority:3),
            Item(itemid:"test020",image:"img020.jpg",priority:3),
        ]
        
        for item in items{
            println(item.image)
        }
        
        // 重要度1の商品を描画
        
        
        // ボタンの生成.
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        //myButton.backgroundColor = accentColor
        myButton.layer.masksToBounds = true
        myButton.setTitle("END", forState: .Normal)
        myButton.layer.cornerRadius = 5.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height/2.4)
        //myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myButton)
    }
    
}
