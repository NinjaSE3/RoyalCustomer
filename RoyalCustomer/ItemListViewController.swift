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
    
    // 商品リスト
    private var itemImageView01: UIImageView!
    private var itemImageView02: UIImageView!
    private var itemImageView03: UIImageView!
    private var itemImageView04: UIImageView!
    private var itemImageView05: UIImageView!
    private var itemImageView06: UIImageView!
    private var itemImageView07: UIImageView!
    private var itemImageView08: UIImageView!
    private var itemImageView09: UIImageView!
    private var itemImageView10: UIImageView!
    private var itemImageView11: UIImageView!
    private var itemImageView12: UIImageView!
    private var itemImageView13: UIImageView!
    private var itemImageView14: UIImageView!
    private var itemImageView15: UIImageView!
    private var itemImageView16: UIImageView!
    private var itemImageView17: UIImageView!
    private var itemImageView18: UIImageView!
    private var itemImageView19: UIImageView!
    private var itemImageView20: UIImageView!
    
    
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
        
        // 商品一覧を作成（今はべた書き）
        // 01
        itemImageView01 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage01 = UIImage(named: "img01.jpg")
        itemImageView01.image = itemImage01
        
        itemImageView01.backgroundColor = UIColor.redColor()
        itemImageView01.layer.position = CGPoint(
            x: itemImageView01.frame.width/2,
            y: itemImageView01.frame.height/2
        )
        self.view.addSubview(itemImageView01)
        
        // 02
        itemImageView02 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage02 = UIImage(named: "img01.jpg")
        itemImageView02.image = itemImage02
        itemImageView02.backgroundColor = UIColor.redColor()
        itemImageView02.layer.position = CGPoint(
            x: itemImageView02.frame.width/2+itemImageView01.frame.width,
            y: itemImageView02.frame.height/2
        )
        self.view.addSubview(itemImageView02)
        
        // 03
        itemImageView03 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage03 = UIImage(named: "img01.jpg")
        itemImageView03.image = itemImage03
        itemImageView03.backgroundColor = UIColor.redColor()
        itemImageView03.layer.position = CGPoint(
            x: itemImageView03.frame.width/2+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView03.frame.height/2
        )
        self.view.addSubview(itemImageView03)
        
        // 04
        itemImageView04 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage04 = UIImage(named: "img01.jpg")
        itemImageView04.image = itemImage04
        itemImageView04.backgroundColor = UIColor.redColor()
        itemImageView04.layer.position = CGPoint(
            x: itemImageView04.frame.width/2+itemImageView03.frame.width+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView04.frame.height/2
        )
        self.view.addSubview(itemImageView04)
        
        // 05
        itemImageView05 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage05 = UIImage(named: "img01.jpg")
        itemImageView05.image = itemImage05
        itemImageView05.backgroundColor = UIColor.redColor()
        itemImageView05.layer.position = CGPoint(
            x: itemImageView05.frame.width/2+itemImageView01.frame.width,
            y: itemImageView05.frame.height/2+itemImageView02.frame.height
        )
        self.view.addSubview(itemImageView05)
        
        // 06
        itemImageView06 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage06 = UIImage(named: "img01.jpg")
        itemImageView06.image = itemImage06
        itemImageView06.backgroundColor = UIColor.redColor()
        itemImageView06.layer.position = CGPoint(
            x: itemImageView06.frame.width/2+itemImageView01.frame.width,
            y: itemImageView06.frame.height/2+itemImageView06.frame.height+itemImageView02.frame.height
        )
        self.view.addSubview(itemImageView06)
        
        // 07
        itemImageView07 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage07 = UIImage(named: "img01.jpg")
        itemImageView07.image = itemImage07
        itemImageView07.backgroundColor = UIColor.redColor()
        itemImageView07.layer.position = CGPoint(
            x: itemImageView07.frame.width/2+itemImageView05.frame.width+itemImageView01.frame.width,
            y: itemImageView07.frame.height/2+itemImageView02.frame.height
        )
        self.view.addSubview(itemImageView07)
        
        // 08
        itemImageView08 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage08 = UIImage(named: "img01.jpg")
        itemImageView08.image = itemImage08
        itemImageView08.backgroundColor = UIColor.redColor()
        itemImageView08.layer.position = CGPoint(
            x: itemImageView08.frame.width/2,
            y: itemImageView08.frame.height/2+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView08)
        
        // 09
        itemImageView09 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage09 = UIImage(named: "img01.jpg")
        itemImageView09.image = itemImage09
        itemImageView09.backgroundColor = UIColor.redColor()
        itemImageView09.layer.position = CGPoint(
            x: itemImageView09.frame.width/2+itemImageView08.frame.width,
            y: itemImageView09.frame.height/2+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView09)
        
        // 10
        itemImageView10 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage10 = UIImage(named: "img01.jpg")
        itemImageView10.image = itemImage10
        itemImageView10.backgroundColor = UIColor.redColor()
        itemImageView10.layer.position = CGPoint(
            x: itemImageView10.frame.width/2+itemImageView08.frame.width+itemImageView09.frame.width,
            y: itemImageView10.frame.height/2+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView10)
        
        // 11
        itemImageView11 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage11 = UIImage(named: "img01.jpg")
        itemImageView11.image = itemImage11
        itemImageView11.backgroundColor = UIColor.redColor()
        itemImageView11.layer.position = CGPoint(
            x: itemImageView11.frame.width/2,
            y: itemImageView11.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView11)
        
        // 12
        itemImageView12 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage12 = UIImage(named: "img01.jpg")
        itemImageView12.image = itemImage12
        itemImageView12.backgroundColor = UIColor.redColor()
        itemImageView12.layer.position = CGPoint(
            x: itemImageView12.frame.width/2+itemImageView11.frame.width,
            y: itemImageView12.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView12)
        
        // 13
        itemImageView13 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage13 = UIImage(named: "img01.jpg")
        itemImageView13.image = itemImage13
        itemImageView13.backgroundColor = UIColor.redColor()
        itemImageView13.layer.position = CGPoint(
            x: itemImageView13.frame.width/2+itemImageView11.frame.width,
            y: itemImageView13.frame.height/2+itemImageView12.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView13)
        
        // 14
        itemImageView14 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage14 = UIImage(named: "img01.jpg")
        itemImageView14.image = itemImage14
        itemImageView14.backgroundColor = UIColor.blueColor()
        itemImageView14.layer.position = CGPoint(
            x: itemImageView14.frame.width/2+itemImageView01.frame.width,
            y: itemImageView14.frame.height/2+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView14)
        
        // 15
        itemImageView15 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage15 = UIImage(named: "img01.jpg")
        itemImageView15.image = itemImage15
        itemImageView15.backgroundColor = UIColor.redColor()
        itemImageView15.layer.position = CGPoint(
            x: itemImageView15.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView15.frame.height/2+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView15)
        
        // 16
        itemImageView16 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage16 = UIImage(named: "img01.jpg")
        itemImageView16.image = itemImage16
        itemImageView16.backgroundColor = UIColor.redColor()
        itemImageView16.layer.position = CGPoint(
            x: itemImageView16.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView16.frame.height/2+itemImageView15.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView16)
        
        // 17
        itemImageView17 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage17 = UIImage(named: "img01.jpg")
        itemImageView17.image = itemImage17
        itemImageView17.backgroundColor = UIColor.redColor()
        itemImageView17.layer.position = CGPoint(
            x: itemImageView17.frame.width/2,
            y: itemImageView17.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView17)
        
        // 18
        itemImageView18 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage18 = UIImage(named: "img01.jpg")
        itemImageView18.image = itemImage18
        itemImageView18.backgroundColor = UIColor.redColor()
        itemImageView18.layer.position = CGPoint(
            x: itemImageView18.frame.width/2,
            y: itemImageView18.frame.height/2+itemImageView17.frame.height+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView18)
        
        // 19
        itemImageView19 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage19 = UIImage(named: "img01.jpg")
        itemImageView19.image = itemImage19
        itemImageView19.backgroundColor = UIColor.redColor()
        itemImageView19.layer.position = CGPoint(
            x: itemImageView19.frame.width/2+itemImageView17.frame.width,
            y: itemImageView19.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView19)
        
        // 20
        itemImageView20 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage20 = UIImage(named: "img01.jpg")
        itemImageView20.image = itemImage20
        itemImageView20.backgroundColor = UIColor.redColor()
        itemImageView20.layer.position = CGPoint(
            x: itemImageView20.frame.width/2+itemImageView19.frame.width+itemImageView17.frame.width,
            y: itemImageView20.frame.height/2+itemImageView14.frame.height+itemImageView01.frame.height
        )
        self.view.addSubview(itemImageView20)
    }
}
