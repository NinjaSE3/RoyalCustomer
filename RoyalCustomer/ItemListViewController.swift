//
//  ItemListViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

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
    private var itemImageView21: UIImageView!
    private var itemImageView22: UIImageView!
    private var itemImageView23: UIImageView!
    private var itemImageView24: UIImageView!
    private var itemImageView25: UIImageView!
    private var itemImageView26: UIImageView!
    private var itemImageView27: UIImageView!
    private var itemImageView28: UIImageView!
    private var itemImageView29: UIImageView!
    private var itemImageView30: UIImageView!
    private var itemImageView31: UIImageView!
    private var itemImageView32: UIImageView!
    private var itemImageView33: UIImageView!
    private var itemImageView34: UIImageView!
    private var itemImageView35: UIImageView!
    private var itemImageView36: UIImageView!
    private var itemImageView37: UIImageView!
    private var itemImageView38: UIImageView!
    private var itemImageView39: UIImageView!
    private var itemImageView40: UIImageView!
    
    // 認定アイコンリスト
    private var award1ImageView01: UIImageView!
    private var award1ImageView02: UIImageView!
    private var award1ImageView03: UIImageView!
    private var award1ImageView04: UIImageView!
    private var award1ImageView05: UIImageView!
    private var award1ImageView06: UIImageView!
    private var award1ImageView07: UIImageView!
    private var award1ImageView08: UIImageView!
    private var award1ImageView09: UIImageView!
    private var award1ImageView10: UIImageView!
    private var award1ImageView11: UIImageView!
    private var award1ImageView12: UIImageView!
    private var award1ImageView13: UIImageView!
    private var award1ImageView14: UIImageView!
    private var award1ImageView15: UIImageView!
    private var award1ImageView16: UIImageView!
    private var award1ImageView17: UIImageView!
    private var award1ImageView18: UIImageView!
    private var award1ImageView19: UIImageView!
    private var award1ImageView20: UIImageView!
    private var award1ImageView21: UIImageView!
    private var award1ImageView22: UIImageView!
    private var award1ImageView23: UIImageView!
    private var award1ImageView24: UIImageView!
    private var award1ImageView25: UIImageView!
    private var award1ImageView26: UIImageView!
    private var award1ImageView27: UIImageView!
    private var award1ImageView28: UIImageView!
    private var award1ImageView29: UIImageView!
    private var award1ImageView30: UIImageView!
    private var award1ImageView31: UIImageView!
    private var award1ImageView32: UIImageView!
    private var award1ImageView33: UIImageView!
    private var award1ImageView34: UIImageView!
    private var award1ImageView35: UIImageView!
    private var award1ImageView36: UIImageView!
    private var award1ImageView37: UIImageView!
    private var award1ImageView38: UIImageView!
    private var award1ImageView39: UIImageView!
    private var award1ImageView40: UIImageView!
    private var award2ImageView01: UIImageView!
    private var award2ImageView02: UIImageView!
    private var award2ImageView03: UIImageView!
    private var award2ImageView04: UIImageView!
    private var award2ImageView05: UIImageView!
    private var award2ImageView06: UIImageView!
    private var award2ImageView07: UIImageView!
    private var award2ImageView08: UIImageView!
    private var award2ImageView09: UIImageView!
    private var award2ImageView10: UIImageView!
    private var award2ImageView11: UIImageView!
    private var award2ImageView12: UIImageView!
    private var award2ImageView13: UIImageView!
    private var award2ImageView14: UIImageView!
    private var award2ImageView15: UIImageView!
    private var award2ImageView16: UIImageView!
    private var award2ImageView17: UIImageView!
    private var award2ImageView18: UIImageView!
    private var award2ImageView19: UIImageView!
    private var award2ImageView20: UIImageView!
    private var award2ImageView21: UIImageView!
    private var award2ImageView22: UIImageView!
    private var award2ImageView23: UIImageView!
    private var award2ImageView24: UIImageView!
    private var award2ImageView25: UIImageView!
    private var award2ImageView26: UIImageView!
    private var award2ImageView27: UIImageView!
    private var award2ImageView28: UIImageView!
    private var award2ImageView29: UIImageView!
    private var award2ImageView30: UIImageView!
    private var award2ImageView31: UIImageView!
    private var award2ImageView32: UIImageView!
    private var award2ImageView33: UIImageView!
    private var award2ImageView34: UIImageView!
    private var award2ImageView35: UIImageView!
    private var award2ImageView36: UIImageView!
    private var award2ImageView37: UIImageView!
    private var award2ImageView38: UIImageView!
    private var award2ImageView39: UIImageView!
    private var award2ImageView40: UIImageView!
    
    // スクロールビュー
    private var scrView = MyScrollView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationView()
        self.itemListView()
        self.awardListView()
        
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
    
    func navigationView(){
        // ナビゲーションの表示
        var imgButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        imgButton.setImage(UIImage(named: "User1"), forState: UIControlState.Normal)
        imgButton.addTarget(self.navigationController, action: Selector("onClickProfile:"), forControlEvents:  UIControlEvents.TouchUpInside)
        var imgButtonItem = UIBarButtonItem(customView: imgButton)
        self.navigationItem.leftBarButtonItem = imgButtonItem
        self.navigationItem.title = "くらさわさん"
    }
    
    func itemListView(){
        
        // 商品一覧を作成（今はべた書き）
        var borderColor = UIColor.blackColor().CGColor
        var borderWidth:CGFloat = 1
        
        // 01
        itemImageView01 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage01 = UIImage(named: items[0].image)
        itemImageView01.tag = 0
        itemImageView01.image = itemImage01
        itemImageView01.layer.borderColor = borderColor
        itemImageView01.layer.borderWidth = borderWidth
        itemImageView01.backgroundColor = UIColor.redColor()
        itemImageView01.layer.position = CGPoint(
            x: itemImageView01.frame.width/2,
            y: itemImageView01.frame.height/2
        )
        itemImageView01.userInteractionEnabled = true
        
        // 02
        itemImageView02 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage02 = UIImage(named: items[1].image)
        itemImageView02.tag = 1
        itemImageView02.image = itemImage02
        itemImageView02.layer.borderColor = borderColor
        itemImageView02.layer.borderWidth = borderWidth
        itemImageView02.backgroundColor = UIColor.redColor()
        itemImageView02.layer.position = CGPoint(
            x: itemImageView02.frame.width/2+itemImageView01.frame.width,
            y: itemImageView02.frame.height/2
        )
        itemImageView02.userInteractionEnabled = true
        
        // 03
        itemImageView03 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage03 = UIImage(named: items[2].image)
        itemImageView03.tag = 2
        itemImageView03.image = itemImage03
        itemImageView03.layer.borderColor = borderColor
        itemImageView03.layer.borderWidth = borderWidth
        itemImageView03.backgroundColor = UIColor.redColor()
        itemImageView03.layer.position = CGPoint(
            x: itemImageView03.frame.width/2+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView03.frame.height/2
        )
        itemImageView03.userInteractionEnabled = true
        
        // 04
        itemImageView04 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage04 = UIImage(named: items[3].image)
        itemImageView04.tag = 3
        itemImageView04.image = itemImage04
        itemImageView04.layer.borderColor = borderColor
        itemImageView04.layer.borderWidth = borderWidth
        itemImageView04.backgroundColor = UIColor.redColor()
        itemImageView04.layer.position = CGPoint(
            x: itemImageView04.frame.width/2+itemImageView03.frame.width+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView04.frame.height/2
        )
        itemImageView04.userInteractionEnabled = true
        
        // 05
        itemImageView05 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage05 = UIImage(named: items[4].image)
        itemImageView05.tag = 4
        itemImageView05.image = itemImage05
        itemImageView05.layer.borderColor = borderColor
        itemImageView05.layer.borderWidth = borderWidth
        itemImageView05.backgroundColor = UIColor.redColor()
        itemImageView05.layer.position = CGPoint(
            x: itemImageView05.frame.width/2+itemImageView01.frame.width,
            y: itemImageView05.frame.height/2+itemImageView02.frame.height
        )
        itemImageView05.userInteractionEnabled = true
        
        // 06
        itemImageView06 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage06 = UIImage(named: items[5].image)
        itemImageView06.tag = 5
        itemImageView06.image = itemImage06
        itemImageView06.layer.borderColor = borderColor
        itemImageView06.layer.borderWidth = borderWidth
        itemImageView06.backgroundColor = UIColor.redColor()
        itemImageView06.layer.position = CGPoint(
            x: itemImageView06.frame.width/2+itemImageView01.frame.width,
            y: itemImageView06.frame.height/2+itemImageView06.frame.height+itemImageView02.frame.height
        )
        itemImageView06.userInteractionEnabled = true
        
        // 07
        itemImageView07 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage07 = UIImage(named: items[6].image)
        itemImageView07.tag = 6
        itemImageView07.image = itemImage07
        itemImageView07.layer.borderColor = borderColor
        itemImageView07.layer.borderWidth = borderWidth
        itemImageView07.backgroundColor = UIColor.redColor()
        itemImageView07.layer.position = CGPoint(
            x: itemImageView07.frame.width/2+itemImageView05.frame.width+itemImageView01.frame.width,
            y: itemImageView07.frame.height/2+itemImageView02.frame.height
        )
        itemImageView07.userInteractionEnabled = true
        
        // 08
        itemImageView08 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage08 = UIImage(named: items[7].image)
        itemImageView08.tag = 7
        itemImageView08.image = itemImage08
        itemImageView08.layer.borderColor = borderColor
        itemImageView08.layer.borderWidth = borderWidth
        itemImageView08.backgroundColor = UIColor.redColor()
        itemImageView08.layer.position = CGPoint(
            x: itemImageView08.frame.width/2,
            y: itemImageView08.frame.height/2+itemImageView01.frame.height
        )
        itemImageView08.userInteractionEnabled = true
        
        // 09
        itemImageView09 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage09 = UIImage(named: items[8].image)
        itemImageView09.tag = 8
        itemImageView09.image = itemImage09
        itemImageView09.layer.borderColor = borderColor
        itemImageView09.layer.borderWidth = borderWidth
        itemImageView09.backgroundColor = UIColor.redColor()
        itemImageView09.layer.position = CGPoint(
            x: itemImageView09.frame.width/2+itemImageView08.frame.width,
            y: itemImageView09.frame.height/2+itemImageView01.frame.height
        )
        itemImageView09.userInteractionEnabled = true
        
        // 10
        itemImageView10 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage10 = UIImage(named: items[9].image)
        itemImageView10.tag = 9
        itemImageView10.image = itemImage10
        itemImageView10.layer.borderColor = borderColor
        itemImageView10.layer.borderWidth = borderWidth
        itemImageView10.backgroundColor = UIColor.redColor()
        itemImageView10.layer.position = CGPoint(
            x: itemImageView10.frame.width/2+itemImageView08.frame.width+itemImageView09.frame.width,
            y: itemImageView10.frame.height/2+itemImageView01.frame.height
        )
        itemImageView10.userInteractionEnabled = true
        
        // 11
        itemImageView11 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage11 = UIImage(named: items[10].image)
        itemImageView11.tag = 10
        itemImageView11.image = itemImage11
        itemImageView11.layer.borderColor = borderColor
        itemImageView11.layer.borderWidth = borderWidth
        itemImageView11.backgroundColor = UIColor.redColor()
        itemImageView11.layer.position = CGPoint(
            x: itemImageView11.frame.width/2,
            y: itemImageView11.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView11.userInteractionEnabled = true

        // 12
        itemImageView12 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage12 = UIImage(named: items[11].image)
        itemImageView12.tag = 11
        itemImageView12.image = itemImage12
        itemImageView12.layer.borderColor = borderColor
        itemImageView12.layer.borderWidth = borderWidth
        itemImageView12.backgroundColor = UIColor.redColor()
        itemImageView12.layer.position = CGPoint(
            x: itemImageView12.frame.width/2+itemImageView11.frame.width,
            y: itemImageView12.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView12.userInteractionEnabled = true
        
        // 13
        itemImageView13 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage13 = UIImage(named: items[12].image)
        itemImageView13.tag = 12
        itemImageView13.image = itemImage13
        itemImageView13.layer.borderColor = borderColor
        itemImageView13.layer.borderWidth = borderWidth
        itemImageView13.backgroundColor = UIColor.redColor()
        itemImageView13.layer.position = CGPoint(
            x: itemImageView13.frame.width/2+itemImageView11.frame.width,
            y: itemImageView13.frame.height/2+itemImageView12.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView13.userInteractionEnabled = true
        
        // 14
        itemImageView14 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage14 = UIImage(named: items[13].image)
        itemImageView14.tag = 13
        itemImageView14.image = itemImage14
        itemImageView14.layer.borderColor = borderColor
        itemImageView14.layer.borderWidth = borderWidth
        itemImageView14.backgroundColor = UIColor.redColor()
        itemImageView14.layer.position = CGPoint(
            x: itemImageView14.frame.width/2+itemImageView01.frame.width,
            y: itemImageView14.frame.height/2+itemImageView01.frame.height
        )
        itemImageView14.userInteractionEnabled = true
        
        // 15
        itemImageView15 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage15 = UIImage(named: items[14].image)
        itemImageView15.tag = 14
        itemImageView15.image = itemImage15
        itemImageView15.layer.borderColor = borderColor
        itemImageView15.layer.borderWidth = borderWidth
        itemImageView15.backgroundColor = UIColor.redColor()
        itemImageView15.layer.position = CGPoint(
            x: itemImageView15.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView15.frame.height/2+itemImageView01.frame.height
        )
        itemImageView15.userInteractionEnabled = true
        
        // 16
        itemImageView16 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage16 = UIImage(named: items[15].image)
        itemImageView16.tag = 15
        itemImageView16.image = itemImage16
        itemImageView16.layer.borderColor = borderColor
        itemImageView16.layer.borderWidth = borderWidth
        itemImageView16.backgroundColor = UIColor.redColor()
        itemImageView16.layer.position = CGPoint(
            x: itemImageView16.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView16.frame.height/2+itemImageView15.frame.height+itemImageView01.frame.height
        )
        itemImageView16.userInteractionEnabled = true
        
        // 17
        itemImageView17 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage17 = UIImage(named: items[16].image)
        itemImageView17.tag = 16
        itemImageView17.image = itemImage17
        itemImageView17.layer.borderColor = borderColor
        itemImageView17.layer.borderWidth = borderWidth
        itemImageView17.backgroundColor = UIColor.redColor()
        itemImageView17.layer.position = CGPoint(
            x: itemImageView17.frame.width/2,
            y: itemImageView17.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView17.userInteractionEnabled = true
        
        // 18
        itemImageView18 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage18 = UIImage(named: items[17].image)
        itemImageView18.tag = 17
        itemImageView18.image = itemImage18
        itemImageView18.layer.borderColor = borderColor
        itemImageView18.layer.borderWidth = borderWidth
        itemImageView18.backgroundColor = UIColor.redColor()
        itemImageView18.layer.position = CGPoint(
            x: itemImageView18.frame.width/2,
            y: itemImageView18.frame.height/2+itemImageView17.frame.height+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView18.userInteractionEnabled = true
        
        // 19
        itemImageView19 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage19 = UIImage(named: items[18].image)
        itemImageView19.tag = 18
        itemImageView19.image = itemImage19
        itemImageView19.layer.borderColor = borderColor
        itemImageView19.layer.borderWidth = borderWidth
        itemImageView19.backgroundColor = UIColor.redColor()
        itemImageView19.layer.position = CGPoint(
            x: itemImageView19.frame.width/2+itemImageView17.frame.width,
            y: itemImageView19.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height
        )
        itemImageView19.userInteractionEnabled = true
        
        // 20
        itemImageView20 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage20 = UIImage(named: items[19].image)
        itemImageView20.tag = 19
        itemImageView20.image = itemImage20
        itemImageView20.layer.borderColor = borderColor
        itemImageView20.layer.borderWidth = borderWidth
        itemImageView20.backgroundColor = UIColor.redColor()
        itemImageView20.layer.position = CGPoint(
            x: itemImageView20.frame.width/2+itemImageView19.frame.width+itemImageView17.frame.width,
            y: itemImageView20.frame.height/2+itemImageView14.frame.height+itemImageView01.frame.height
        )
        itemImageView20.userInteractionEnabled = true
        
        var pageHeight = itemImageView01.frame.height + itemImageView08.frame.height + itemImageView11.frame.height + itemImageView19.frame.height
        
        // 21
        itemImageView21 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage21 = UIImage(named: items[20].image)
        itemImageView21.tag = 20
        itemImageView21.image = itemImage21
        itemImageView21.layer.borderColor = borderColor
        itemImageView21.layer.borderWidth = borderWidth
        itemImageView21.backgroundColor = UIColor.redColor()
        itemImageView21.layer.position = CGPoint(
            x: itemImageView21.frame.width/2,
            y: itemImageView21.frame.height/2+pageHeight
        )
        itemImageView21.userInteractionEnabled = true
        
        // 22
        itemImageView22 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage22 = UIImage(named: items[21].image)
        itemImageView22.tag = 21
        itemImageView22.image = itemImage22
        itemImageView22.layer.borderColor = borderColor
        itemImageView22.layer.borderWidth = borderWidth
        itemImageView22.backgroundColor = UIColor.redColor()
        itemImageView22.layer.position = CGPoint(
            x: itemImageView22.frame.width/2+itemImageView01.frame.width,
            y: itemImageView22.frame.height/2+pageHeight
        )
        itemImageView22.userInteractionEnabled = true
        
        // 23
        itemImageView23 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage23 = UIImage(named: items[22].image)
        itemImageView23.tag = 22
        itemImageView23.image = itemImage23
        itemImageView23.layer.borderColor = borderColor
        itemImageView23.layer.borderWidth = borderWidth
        itemImageView23.backgroundColor = UIColor.redColor()
        itemImageView23.layer.position = CGPoint(
            x: itemImageView23.frame.width/2+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView23.frame.height/2+pageHeight
        )
        itemImageView23.userInteractionEnabled = true
        
        // 24
        itemImageView24 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage24 = UIImage(named: items[23].image)
        itemImageView24.tag = 23
        itemImageView24.image = itemImage24
        itemImageView24.layer.borderColor = borderColor
        itemImageView24.layer.borderWidth = borderWidth
        itemImageView24.backgroundColor = UIColor.redColor()
        itemImageView24.layer.position = CGPoint(
            x: itemImageView24.frame.width/2+itemImageView03.frame.width+itemImageView02.frame.width+itemImageView01.frame.width,
            y: itemImageView24.frame.height/2+pageHeight
        )
        itemImageView24.userInteractionEnabled = true
        
        // 25
        itemImageView25 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage25 = UIImage(named: items[24].image)
        itemImageView25.tag = 24
        itemImageView25.image = itemImage25
        itemImageView25.layer.borderColor = borderColor
        itemImageView25.layer.borderWidth = borderWidth
        itemImageView25.backgroundColor = UIColor.redColor()
        itemImageView25.layer.position = CGPoint(
            x: itemImageView25.frame.width/2+itemImageView01.frame.width,
            y: itemImageView25.frame.height/2+itemImageView02.frame.height+pageHeight
        )
        itemImageView25.userInteractionEnabled = true
        
        // 26
        itemImageView26 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage26 = UIImage(named: items[25].image)
        itemImageView26.tag = 25
        itemImageView26.image = itemImage26
        itemImageView26.layer.borderColor = borderColor
        itemImageView26.layer.borderWidth = borderWidth
        itemImageView26.backgroundColor = UIColor.redColor()
        itemImageView26.layer.position = CGPoint(
            x: itemImageView26.frame.width/2+itemImageView01.frame.width,
            y: itemImageView26.frame.height/2+itemImageView06.frame.height+itemImageView02.frame.height+pageHeight
        )
        itemImageView26.userInteractionEnabled = true
        
        // 27
        itemImageView27 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage27 = UIImage(named: items[26].image)
        itemImageView27.tag = 26
        itemImageView27.image = itemImage27
        itemImageView27.layer.borderColor = borderColor
        itemImageView27.layer.borderWidth = borderWidth
        itemImageView27.backgroundColor = UIColor.redColor()
        itemImageView27.layer.position = CGPoint(
            x: itemImageView27.frame.width/2+itemImageView05.frame.width+itemImageView01.frame.width,
            y: itemImageView27.frame.height/2+itemImageView02.frame.height+pageHeight
        )
        itemImageView27.userInteractionEnabled = true
        
        // 28
        itemImageView28 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage28 = UIImage(named: items[27].image)
        itemImageView28.tag = 27
        itemImageView28.image = itemImage28
        itemImageView28.layer.borderColor = borderColor
        itemImageView28.layer.borderWidth = borderWidth
        itemImageView28.backgroundColor = UIColor.redColor()
        itemImageView28.layer.position = CGPoint(
            x: itemImageView28.frame.width/2,
            y: itemImageView28.frame.height/2+itemImageView01.frame.height+pageHeight
        )
        itemImageView28.userInteractionEnabled = true
        
        // 29
        itemImageView29 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage29 = UIImage(named: items[28].image)
        itemImageView29.tag = 28
        itemImageView29.image = itemImage29
        itemImageView29.layer.borderColor = borderColor
        itemImageView29.layer.borderWidth = borderWidth
        itemImageView29.backgroundColor = UIColor.redColor()
        itemImageView29.layer.position = CGPoint(
            x: itemImageView29.frame.width/2+itemImageView08.frame.width,
            y: itemImageView29.frame.height/2+itemImageView01.frame.height+pageHeight
        )
        itemImageView29.userInteractionEnabled = true
        
        // 30
        itemImageView30 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage30 = UIImage(named: items[29].image)
        itemImageView30.tag = 29
        itemImageView30.image = itemImage30
        itemImageView30.layer.borderColor = borderColor
        itemImageView30.layer.borderWidth = borderWidth
        itemImageView30.backgroundColor = UIColor.redColor()
        itemImageView30.layer.position = CGPoint(
            x: itemImageView30.frame.width/2+itemImageView08.frame.width+itemImageView09.frame.width,
            y: itemImageView30.frame.height/2+itemImageView01.frame.height+pageHeight
        )
        itemImageView30.userInteractionEnabled = true
        
        // 31
        itemImageView31 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage31 = UIImage(named: items[30].image)
        itemImageView31.tag = 30
        itemImageView31.image = itemImage31
        itemImageView31.layer.borderColor = borderColor
        itemImageView31.layer.borderWidth = borderWidth
        itemImageView31.backgroundColor = UIColor.redColor()
        itemImageView31.layer.position = CGPoint(
            x: itemImageView31.frame.width/2,
            y: itemImageView31.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView31.userInteractionEnabled = true
        
        // 32
        itemImageView32 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage32 = UIImage(named: items[31].image)
        itemImageView32.tag = 31
        itemImageView32.image = itemImage32
        itemImageView32.layer.borderColor = borderColor
        itemImageView32.layer.borderWidth = borderWidth
        itemImageView32.backgroundColor = UIColor.redColor()
        itemImageView32.layer.position = CGPoint(
            x: itemImageView32.frame.width/2+itemImageView11.frame.width,
            y: itemImageView32.frame.height/2+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView32.userInteractionEnabled = true
        
        // 33
        itemImageView33 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage33 = UIImage(named: items[32].image)
        itemImageView33.tag = 32
        itemImageView33.image = itemImage33
        itemImageView33.layer.borderColor = borderColor
        itemImageView33.layer.borderWidth = borderWidth
        itemImageView33.backgroundColor = UIColor.redColor()
        itemImageView33.layer.position = CGPoint(
            x: itemImageView33.frame.width/2+itemImageView11.frame.width,
            y: itemImageView33.frame.height/2+itemImageView12.frame.height+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView33.userInteractionEnabled = true
        
        // 34
        itemImageView34 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage34 = UIImage(named: items[33].image)
        itemImageView34.tag = 33
        itemImageView34.image = itemImage34
        itemImageView34.layer.borderColor = borderColor
        itemImageView34.layer.borderWidth = borderWidth
        itemImageView34.backgroundColor = UIColor.redColor()
        itemImageView34.layer.position = CGPoint(
            x: itemImageView34.frame.width/2+itemImageView01.frame.width,
            y: itemImageView34.frame.height/2+itemImageView01.frame.height+pageHeight
        )
        itemImageView34.userInteractionEnabled = true
        
        // 35
        itemImageView35 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage35 = UIImage(named: items[34].image)
        itemImageView35.tag = 34
        itemImageView35.image = itemImage35
        itemImageView35.layer.borderColor = borderColor
        itemImageView35.layer.borderWidth = borderWidth
        itemImageView35.backgroundColor = UIColor.redColor()
        itemImageView35.layer.position = CGPoint(
            x: itemImageView35.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView35.frame.height/2+itemImageView01.frame.height+pageHeight
        )
        itemImageView35.userInteractionEnabled = true
        
        // 36
        itemImageView36 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage36 = UIImage(named: items[35].image)
        itemImageView36.tag = 35
        itemImageView36.image = itemImage36
        itemImageView36.layer.borderColor = borderColor
        itemImageView36.layer.borderWidth = borderWidth
        itemImageView36.backgroundColor = UIColor.redColor()
        itemImageView36.layer.position = CGPoint(
            x: itemImageView36.frame.width/2+itemImageView14.frame.width+itemImageView01.frame.width,
            y: itemImageView36.frame.height/2+itemImageView15.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView36.userInteractionEnabled = true
        
        // 37
        itemImageView37 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage37 = UIImage(named: items[36].image)
        itemImageView37.tag = 36
        itemImageView37.image = itemImage37
        itemImageView37.layer.borderColor = borderColor
        itemImageView37.layer.borderWidth = borderWidth
        itemImageView37.backgroundColor = UIColor.redColor()
        itemImageView37.layer.position = CGPoint(
            x: itemImageView37.frame.width/2,
            y: itemImageView37.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView37.userInteractionEnabled = true
        
        // 38
        itemImageView38 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/6,self.view.bounds.width/6))
        let itemImage38 = UIImage(named: items[37].image)
        itemImageView38.tag = 37
        itemImageView38.image = itemImage38
        itemImageView38.layer.borderColor = borderColor
        itemImageView38.layer.borderWidth = borderWidth
        itemImageView38.backgroundColor = UIColor.redColor()
        itemImageView38.layer.position = CGPoint(
            x: itemImageView38.frame.width/2,
            y: itemImageView38.frame.height/2+itemImageView17.frame.height+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView38.userInteractionEnabled = true
        
        // 39
        itemImageView39 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/3,self.view.bounds.width/3))
        let itemImage39 = UIImage(named: items[38].image)
        itemImageView39.tag = 38
        itemImageView39.image = itemImage39
        itemImageView39.layer.borderColor = borderColor
        itemImageView39.layer.borderWidth = borderWidth
        itemImageView39.backgroundColor = UIColor.redColor()
        itemImageView39.layer.position = CGPoint(
            x: itemImageView39.frame.width/2+itemImageView17.frame.width,
            y: itemImageView39.frame.height/2+itemImageView11.frame.height+itemImageView08.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView39.userInteractionEnabled = true
        
        // 40
        itemImageView40 = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width/2,self.view.bounds.width/2))
        let itemImage40 = UIImage(named: items[39].image)
        itemImageView40.tag = 39
        itemImageView40.image = itemImage40
        itemImageView40.layer.borderColor = borderColor
        itemImageView40.layer.borderWidth = borderWidth
        itemImageView40.backgroundColor = UIColor.redColor()
        itemImageView40.layer.position = CGPoint(
            x: itemImageView40.frame.width/2+itemImageView19.frame.width+itemImageView17.frame.width,
            y: itemImageView40.frame.height/2+itemImageView14.frame.height+itemImageView01.frame.height+pageHeight
        )
        itemImageView40.userInteractionEnabled = true
        
        // スクロールview
        scrView.delaysContentTouches = false
        // ページサイズ
        scrView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        // 全体のサイズ
        scrView.contentSize = CGSizeMake(view.bounds.width, pageHeight*2)
        // 配置
        scrView.layer.position = CGPoint(
            x: scrView.frame.width/2,
            y: scrView.frame.height/2
        )
        let gesture = UITapGestureRecognizer(target:self, action:"onClickItemImageView:")
        scrView.addGestureRecognizer(gesture)
        self.view.addSubview(scrView)
        
        // 各イメージを追加
        scrView.addSubview(itemImageView01)
        scrView.addSubview(itemImageView02)
        scrView.addSubview(itemImageView03)
        scrView.addSubview(itemImageView04)
        scrView.addSubview(itemImageView05)
        scrView.addSubview(itemImageView06)
        scrView.addSubview(itemImageView07)
        scrView.addSubview(itemImageView08)
        scrView.addSubview(itemImageView09)
        scrView.addSubview(itemImageView10)
        scrView.addSubview(itemImageView11)
        scrView.addSubview(itemImageView12)
        scrView.addSubview(itemImageView13)
        scrView.addSubview(itemImageView14)
        scrView.addSubview(itemImageView15)
        scrView.addSubview(itemImageView16)
        scrView.addSubview(itemImageView17)
        scrView.addSubview(itemImageView18)
        scrView.addSubview(itemImageView19)
        scrView.addSubview(itemImageView20)
        scrView.addSubview(itemImageView21)
        scrView.addSubview(itemImageView22)
        scrView.addSubview(itemImageView23)
        scrView.addSubview(itemImageView24)
        scrView.addSubview(itemImageView25)
        scrView.addSubview(itemImageView26)
        scrView.addSubview(itemImageView27)
        scrView.addSubview(itemImageView28)
        scrView.addSubview(itemImageView29)
        scrView.addSubview(itemImageView30)
        scrView.addSubview(itemImageView31)
        scrView.addSubview(itemImageView32)
        scrView.addSubview(itemImageView33)
        scrView.addSubview(itemImageView34)
        scrView.addSubview(itemImageView35)
        scrView.addSubview(itemImageView36)
        scrView.addSubview(itemImageView37)
        scrView.addSubview(itemImageView38)
        scrView.addSubview(itemImageView39)
        scrView.addSubview(itemImageView40)
        
    }
    
    func awardListView(){
        // 認定アイコンを表示
        
        // アイコンサイズ係数
        var awardIconSize:CGFloat = 0.2
        
        // 1
        if !items[0].award1.isEmpty {
            var award1Image01:UIImage!

            switch awards[Int(items[0].award1[0])].level {
            case 1:
                award1Image01 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image01 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image01 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView01 = UIImageView(frame: CGRectMake(0,0,itemImageView01.frame.width*awardIconSize,itemImageView01.frame.height*awardIconSize))
            award1ImageView01.tag = 0
            award1ImageView01.image = award1Image01
            award1ImageView01.layer.position = CGPoint(
                x: itemImageView01.frame.maxX - itemImageView01.frame.width*awardIconSize/2,
                y: itemImageView01.frame.minY + itemImageView01.frame.height*awardIconSize/2
            )
            award1ImageView01.userInteractionEnabled = true
            scrView.addSubview(award1ImageView01)
        }
        if !items[0].award2.isEmpty {
            var award2Image01:UIImage!
            
            switch awards[Int(items[0].award2[0])].level {
            case 1:
                award2Image01 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image01 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image01 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView01 = UIImageView(frame: CGRectMake(0,0,itemImageView01.frame.width*awardIconSize,itemImageView01.frame.height*awardIconSize))
            award2ImageView01.tag = 0
            award2ImageView01.image = award2Image01
            award2ImageView01.layer.position = CGPoint(
                x: itemImageView01.frame.maxX - itemImageView01.frame.width*awardIconSize/2,
                y: itemImageView01.frame.minY + itemImageView01.frame.height*awardIconSize*1.5
            )
            award2ImageView01.userInteractionEnabled = true
            scrView.addSubview(award2ImageView01)
        }
        
        //2
        if !items[1].award1.isEmpty {
            var award1Image02:UIImage!
            
            switch awards[Int(items[1].award1[0])].level {
            case 1:
                award1Image02 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image02 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image02 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView02 = UIImageView(frame: CGRectMake(0,0,itemImageView02.frame.width*awardIconSize,itemImageView02.frame.height*awardIconSize))
            award1ImageView02.tag = 0
            award1ImageView02.image = award1Image02
            award1ImageView02.layer.position = CGPoint(
                x: itemImageView02.frame.maxX - itemImageView02.frame.width*awardIconSize/2,
                y: itemImageView02.frame.minY + itemImageView02.frame.height*awardIconSize/2
            )
            award1ImageView02.userInteractionEnabled = true
            scrView.addSubview(award1ImageView02)
        }
        if !items[1].award2.isEmpty {
            var award2Image02:UIImage!
            
            switch awards[Int(items[1].award2[0])].level {
            case 1:
                award2Image02 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image02 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image02 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView02 = UIImageView(frame: CGRectMake(0,0,itemImageView02.frame.width*awardIconSize,itemImageView02.frame.height*awardIconSize))
            award2ImageView02.tag = 0
            award2ImageView02.image = award2Image02
            award2ImageView02.layer.position = CGPoint(
                x: itemImageView02.frame.maxX - itemImageView02.frame.width*awardIconSize/2,
                y: itemImageView02.frame.minY + itemImageView02.frame.height*awardIconSize*1.5
            )
            award2ImageView02.userInteractionEnabled = true
            scrView.addSubview(award2ImageView02)
        }
        
        // 3
        if !items[2].award1.isEmpty {
            var award1Image03:UIImage!
            
            switch awards[Int(items[2].award1[0])].level {
            case 1:
                award1Image03 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image03 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image03 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView03 = UIImageView(frame: CGRectMake(0,0,itemImageView03.frame.width*awardIconSize,itemImageView03.frame.height*awardIconSize))
            award1ImageView03.tag = 0
            award1ImageView03.image = award1Image03
            award1ImageView03.layer.position = CGPoint(
                x: itemImageView03.frame.maxX - itemImageView03.frame.width*awardIconSize/2,
                y: itemImageView03.frame.minY + itemImageView03.frame.height*awardIconSize/2
            )
            award1ImageView03.userInteractionEnabled = true
            scrView.addSubview(award1ImageView03)
        }
        if !items[2].award2.isEmpty {
            var award2Image03:UIImage!
            
            switch awards[Int(items[2].award2[0])].level {
            case 1:
                award2Image03 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image03 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image03 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView03 = UIImageView(frame: CGRectMake(0,0,itemImageView03.frame.width*awardIconSize,itemImageView03.frame.height*awardIconSize))
            award2ImageView03.tag = 0
            award2ImageView03.image = award2Image03
            award2ImageView03.layer.position = CGPoint(
                x: itemImageView03.frame.maxX - itemImageView03.frame.width*awardIconSize/2,
                y: itemImageView03.frame.minY + itemImageView03.frame.height*awardIconSize*1.5
            )
            award2ImageView03.userInteractionEnabled = true
            scrView.addSubview(award2ImageView03)
        }
        
        // 4
        if !items[3].award1.isEmpty {
            var award1Image04:UIImage!
            
            switch awards[Int(items[3].award1[0])].level {
            case 1:
                award1Image04 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image04 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image04 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView04 = UIImageView(frame: CGRectMake(0,0,itemImageView04.frame.width*awardIconSize,itemImageView04.frame.height*awardIconSize))
            award1ImageView04.tag = 0
            award1ImageView04.image = award1Image04
            award1ImageView04.layer.position = CGPoint(
                x: itemImageView04.frame.maxX - itemImageView04.frame.width*awardIconSize/2,
                y: itemImageView04.frame.minY + itemImageView04.frame.height*awardIconSize/2
            )
            award1ImageView04.userInteractionEnabled = true
            scrView.addSubview(award1ImageView04)
        }
        if !items[3].award2.isEmpty {
            var award2Image04:UIImage!
            
            switch awards[Int(items[3].award2[0])].level {
            case 1:
                award2Image04 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image04 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image04 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView04 = UIImageView(frame: CGRectMake(0,0,itemImageView04.frame.width*awardIconSize,itemImageView04.frame.height*awardIconSize))
            award2ImageView04.tag = 0
            award2ImageView04.image = award2Image04
            award2ImageView04.layer.position = CGPoint(
                x: itemImageView04.frame.maxX - itemImageView04.frame.width*awardIconSize/2,
                y: itemImageView04.frame.minY + itemImageView04.frame.height*awardIconSize*1.5
            )
            award2ImageView04.userInteractionEnabled = true
            scrView.addSubview(award2ImageView04)
        }
        
        // 5
        if !items[4].award1.isEmpty {
            var award1Image05:UIImage!
            
            switch awards[Int(items[4].award1[0])].level {
            case 1:
                award1Image05 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image05 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image05 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView05 = UIImageView(frame: CGRectMake(0,0,itemImageView05.frame.width*awardIconSize,itemImageView05.frame.height*awardIconSize))
            award1ImageView05.tag = 0
            award1ImageView05.image = award1Image05
            award1ImageView05.layer.position = CGPoint(
                x: itemImageView05.frame.maxX - itemImageView05.frame.width*awardIconSize/2,
                y: itemImageView05.frame.minY + itemImageView05.frame.height*awardIconSize/2
            )
            award1ImageView05.userInteractionEnabled = true
            scrView.addSubview(award1ImageView05)
        }
        if !items[4].award2.isEmpty {
            var award2Image05:UIImage!
            
            switch awards[Int(items[4].award2[0])].level {
            case 1:
                award2Image05 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image05 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image05 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView05 = UIImageView(frame: CGRectMake(0,0,itemImageView05.frame.width*awardIconSize,itemImageView05.frame.height*awardIconSize))
            award2ImageView05.tag = 0
            award2ImageView05.image = award2Image05
            award2ImageView05.layer.position = CGPoint(
                x: itemImageView05.frame.maxX - itemImageView05.frame.width*awardIconSize/2,
                y: itemImageView05.frame.minY + itemImageView05.frame.height*awardIconSize*1.5
            )
            award2ImageView05.userInteractionEnabled = true
            scrView.addSubview(award2ImageView05)
        }
        
        // 6
        if !items[5].award1.isEmpty {
            var award1Image06:UIImage!
            
            switch awards[Int(items[5].award1[0])].level {
            case 1:
                award1Image06 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image06 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image06 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView06 = UIImageView(frame: CGRectMake(0,0,itemImageView06.frame.width*awardIconSize,itemImageView06.frame.height*awardIconSize))
            award1ImageView06.tag = 0
            award1ImageView06.image = award1Image06
            award1ImageView06.layer.position = CGPoint(
                x: itemImageView06.frame.maxX - itemImageView06.frame.width*awardIconSize/2,
                y: itemImageView06.frame.minY + itemImageView06.frame.height*awardIconSize/2
            )
            award1ImageView06.userInteractionEnabled = true
            scrView.addSubview(award1ImageView06)
        }
        if !items[5].award2.isEmpty {
            var award2Image06:UIImage!
            
            switch awards[Int(items[5].award2[0])].level {
            case 1:
                award2Image06 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image06 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image06 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView06 = UIImageView(frame: CGRectMake(0,0,itemImageView06.frame.width*awardIconSize,itemImageView06.frame.height*awardIconSize))
            award2ImageView06.tag = 0
            award2ImageView06.image = award2Image06
            award2ImageView06.layer.position = CGPoint(
                x: itemImageView06.frame.maxX - itemImageView06.frame.width*awardIconSize/2,
                y: itemImageView06.frame.minY + itemImageView06.frame.height*awardIconSize*1.5
            )
            award2ImageView06.userInteractionEnabled = true
            scrView.addSubview(award2ImageView06)
        }
        
        // 7
        if !items[6].award1.isEmpty {
            var award1Image07:UIImage!
            
            switch awards[Int(items[6].award1[0])].level {
            case 1:
                award1Image07 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image07 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image07 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView07 = UIImageView(frame: CGRectMake(0,0,itemImageView07.frame.width*awardIconSize,itemImageView07.frame.height*awardIconSize))
            award1ImageView07.tag = 0
            award1ImageView07.image = award1Image07
            award1ImageView07.layer.position = CGPoint(
                x: itemImageView07.frame.maxX - itemImageView07.frame.width*awardIconSize/2,
                y: itemImageView07.frame.minY + itemImageView07.frame.height*awardIconSize/2
            )
            award1ImageView07.userInteractionEnabled = true
            scrView.addSubview(award1ImageView07)
        }
        if !items[6].award2.isEmpty {
            var award2Image07:UIImage!
            
            switch awards[Int(items[6].award2[0])].level {
            case 1:
                award2Image07 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image07 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image07 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView07 = UIImageView(frame: CGRectMake(0,0,itemImageView07.frame.width*awardIconSize,itemImageView07.frame.height*awardIconSize))
            award2ImageView07.tag = 0
            award2ImageView07.image = award2Image07
            award2ImageView07.layer.position = CGPoint(
                x: itemImageView07.frame.maxX - itemImageView07.frame.width*awardIconSize/2,
                y: itemImageView07.frame.minY + itemImageView07.frame.height*awardIconSize*1.6
            )
            award2ImageView07.userInteractionEnabled = true
            scrView.addSubview(award2ImageView07)
        }
        
        // 8
        if !items[7].award1.isEmpty {
            var award1Image08:UIImage!
            
            switch awards[Int(items[7].award1[0])].level {
            case 1:
                award1Image08 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image08 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image08 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView08 = UIImageView(frame: CGRectMake(0,0,itemImageView08.frame.width*awardIconSize,itemImageView08.frame.height*awardIconSize))
            award1ImageView08.tag = 0
            award1ImageView08.image = award1Image08
            award1ImageView08.layer.position = CGPoint(
                x: itemImageView08.frame.maxX - itemImageView08.frame.width*awardIconSize/2,
                y: itemImageView08.frame.minY + itemImageView08.frame.height*awardIconSize/2
            )
            award1ImageView08.userInteractionEnabled = true
            scrView.addSubview(award1ImageView08)
        }
        if !items[7].award2.isEmpty {
            var award2Image08:UIImage!
            
            switch awards[Int(items[7].award2[0])].level {
            case 1:
                award2Image08 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image08 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image08 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView08 = UIImageView(frame: CGRectMake(0,0,itemImageView08.frame.width*awardIconSize,itemImageView08.frame.height*awardIconSize))
            award2ImageView08.tag = 0
            award2ImageView08.image = award2Image08
            award2ImageView08.layer.position = CGPoint(
                x: itemImageView08.frame.maxX - itemImageView08.frame.width*awardIconSize/2,
                y: itemImageView08.frame.minY + itemImageView08.frame.height*awardIconSize*1.7
            )
            award2ImageView08.userInteractionEnabled = true
            scrView.addSubview(award2ImageView08)
        }
        
        // 9
        if !items[8].award1.isEmpty {
            var award1Image09:UIImage!
            
            switch awards[Int(items[8].award1[0])].level {
            case 1:
                award1Image09 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image09 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image09 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView09 = UIImageView(frame: CGRectMake(0,0,itemImageView09.frame.width*awardIconSize,itemImageView09.frame.height*awardIconSize))
            award1ImageView09.tag = 0
            award1ImageView09.image = award1Image09
            award1ImageView09.layer.position = CGPoint(
                x: itemImageView09.frame.maxX - itemImageView09.frame.width*awardIconSize/2,
                y: itemImageView09.frame.minY + itemImageView09.frame.height*awardIconSize/2
            )
            award1ImageView09.userInteractionEnabled = true
            scrView.addSubview(award1ImageView09)
        }
        if !items[8].award2.isEmpty {
            var award2Image09:UIImage!
            
            switch awards[Int(items[8].award2[0])].level {
            case 1:
                award2Image09 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image09 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image09 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView09 = UIImageView(frame: CGRectMake(0,0,itemImageView09.frame.width*awardIconSize,itemImageView09.frame.height*awardIconSize))
            award2ImageView09.tag = 0
            award2ImageView09.image = award2Image09
            award2ImageView09.layer.position = CGPoint(
                x: itemImageView09.frame.maxX - itemImageView09.frame.width*awardIconSize/2,
                y: itemImageView09.frame.minY + itemImageView09.frame.height*awardIconSize*1.8
            )
            award2ImageView09.userInteractionEnabled = true
            scrView.addSubview(award2ImageView09)
        }
        
        // 10
        if !items[9].award1.isEmpty {
            var award1Image10:UIImage!
            
            switch awards[Int(items[9].award1[0])].level {
            case 1:
                award1Image10 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image10 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image10 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView10 = UIImageView(frame: CGRectMake(0,0,itemImageView10.frame.width*awardIconSize,itemImageView10.frame.height*awardIconSize))
            award1ImageView10.tag = 0
            award1ImageView10.image = award1Image10
            award1ImageView10.layer.position = CGPoint(
                x: itemImageView10.frame.maxX - itemImageView10.frame.width*awardIconSize/2,
                y: itemImageView10.frame.minY + itemImageView10.frame.height*awardIconSize/2
            )
            award1ImageView10.userInteractionEnabled = true
            scrView.addSubview(award1ImageView10)
        }
        if !items[9].award2.isEmpty {
            var award2Image10:UIImage!
            
            switch awards[Int(items[9].award2[0])].level {
            case 1:
                award2Image10 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image10 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image10 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView10 = UIImageView(frame: CGRectMake(0,0,itemImageView10.frame.width*awardIconSize,itemImageView10.frame.height*awardIconSize))
            award2ImageView10.tag = 0
            award2ImageView10.image = award2Image10
            award2ImageView10.layer.position = CGPoint(
                x: itemImageView10.frame.maxX - itemImageView10.frame.width*awardIconSize/2,
                y: itemImageView10.frame.minY + itemImageView10.frame.height*awardIconSize*1.9
            )
            award2ImageView10.userInteractionEnabled = true
            scrView.addSubview(award2ImageView10)
        }
        
        // 11
        if !items[10].award1.isEmpty {
            var award1Image11:UIImage!
            
            switch awards[Int(items[10].award1[0])].level {
            case 1:
                award1Image11 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image11 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image11 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView11 = UIImageView(frame: CGRectMake(0,0,itemImageView11.frame.width*awardIconSize,itemImageView11.frame.height*awardIconSize))
            award1ImageView11.tag = 0
            award1ImageView11.image = award1Image11
            award1ImageView11.layer.position = CGPoint(
                x: itemImageView11.frame.maxX - itemImageView11.frame.width*awardIconSize/2,
                y: itemImageView11.frame.minY + itemImageView11.frame.height*awardIconSize/2
            )
            award1ImageView11.userInteractionEnabled = true
            scrView.addSubview(award1ImageView11)
        }
        if !items[10].award2.isEmpty {
            var award2Image11:UIImage!
            
            switch awards[Int(items[10].award2[0])].level {
            case 1:
                award2Image11 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image11 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image11 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView11 = UIImageView(frame: CGRectMake(0,0,itemImageView11.frame.width*awardIconSize,itemImageView11.frame.height*awardIconSize))
            award2ImageView11.tag = 0
            award2ImageView11.image = award2Image11
            award2ImageView11.layer.position = CGPoint(
                x: itemImageView11.frame.maxX - itemImageView11.frame.width*awardIconSize/2,
                y: itemImageView11.frame.minY + itemImageView11.frame.height*awardIconSize*1.10
            )
            award2ImageView11.userInteractionEnabled = true
            scrView.addSubview(award2ImageView11)
        }
        
        // 12
        if !items[11].award1.isEmpty {
            var award1Image12:UIImage!
            
            switch awards[Int(items[11].award1[0])].level {
            case 1:
                award1Image12 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image12 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image12 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView12 = UIImageView(frame: CGRectMake(0,0,itemImageView12.frame.width*awardIconSize,itemImageView12.frame.height*awardIconSize))
            award1ImageView12.tag = 0
            award1ImageView12.image = award1Image12
            award1ImageView12.layer.position = CGPoint(
                x: itemImageView12.frame.maxX - itemImageView12.frame.width*awardIconSize/2,
                y: itemImageView12.frame.minY + itemImageView12.frame.height*awardIconSize/2
            )
            award1ImageView12.userInteractionEnabled = true
            scrView.addSubview(award1ImageView12)
        }
        if !items[11].award2.isEmpty {
            var award2Image12:UIImage!
            
            switch awards[Int(items[11].award2[0])].level {
            case 1:
                award2Image12 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image12 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image12 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView12 = UIImageView(frame: CGRectMake(0,0,itemImageView12.frame.width*awardIconSize,itemImageView12.frame.height*awardIconSize))
            award2ImageView12.tag = 0
            award2ImageView12.image = award2Image12
            award2ImageView12.layer.position = CGPoint(
                x: itemImageView12.frame.maxX - itemImageView12.frame.width*awardIconSize/2,
                y: itemImageView12.frame.minY + itemImageView12.frame.height*awardIconSize*1.11
            )
            award2ImageView12.userInteractionEnabled = true
            scrView.addSubview(award2ImageView12)
        }
        
        // 13
        if !items[12].award1.isEmpty {
            var award1Image13:UIImage!
            
            switch awards[Int(items[12].award1[0])].level {
            case 1:
                award1Image13 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image13 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image13 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView13 = UIImageView(frame: CGRectMake(0,0,itemImageView13.frame.width*awardIconSize,itemImageView13.frame.height*awardIconSize))
            award1ImageView13.tag = 0
            award1ImageView13.image = award1Image13
            award1ImageView13.layer.position = CGPoint(
                x: itemImageView13.frame.maxX - itemImageView13.frame.width*awardIconSize/2,
                y: itemImageView13.frame.minY + itemImageView13.frame.height*awardIconSize/2
            )
            award1ImageView13.userInteractionEnabled = true
            scrView.addSubview(award1ImageView13)
        }
        if !items[12].award2.isEmpty {
            var award2Image13:UIImage!
            
            switch awards[Int(items[12].award2[0])].level {
            case 1:
                award2Image13 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image13 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image13 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView13 = UIImageView(frame: CGRectMake(0,0,itemImageView13.frame.width*awardIconSize,itemImageView13.frame.height*awardIconSize))
            award2ImageView13.tag = 0
            award2ImageView13.image = award2Image13
            award2ImageView13.layer.position = CGPoint(
                x: itemImageView13.frame.maxX - itemImageView13.frame.width*awardIconSize/2,
                y: itemImageView13.frame.minY + itemImageView13.frame.height*awardIconSize*1.12
            )
            award2ImageView13.userInteractionEnabled = true
            scrView.addSubview(award2ImageView13)
        }
        
        // 14
        if !items[13].award1.isEmpty {
            var award1Image14:UIImage!
            
            switch awards[Int(items[13].award1[0])].level {
            case 1:
                award1Image14 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image14 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image14 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView14 = UIImageView(frame: CGRectMake(0,0,itemImageView14.frame.width*awardIconSize,itemImageView14.frame.height*awardIconSize))
            award1ImageView14.tag = 0
            award1ImageView14.image = award1Image14
            award1ImageView14.layer.position = CGPoint(
                x: itemImageView14.frame.maxX - itemImageView14.frame.width*awardIconSize/2,
                y: itemImageView14.frame.minY + itemImageView14.frame.height*awardIconSize/2
            )
            award1ImageView14.userInteractionEnabled = true
            scrView.addSubview(award1ImageView14)
        }
        if !items[13].award2.isEmpty {
            var award2Image14:UIImage!
            
            switch awards[Int(items[13].award2[0])].level {
            case 1:
                award2Image14 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image14 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image14 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView14 = UIImageView(frame: CGRectMake(0,0,itemImageView14.frame.width*awardIconSize,itemImageView14.frame.height*awardIconSize))
            award2ImageView14.tag = 0
            award2ImageView14.image = award2Image14
            award2ImageView14.layer.position = CGPoint(
                x: itemImageView14.frame.maxX - itemImageView14.frame.width*awardIconSize/2,
                y: itemImageView14.frame.minY + itemImageView14.frame.height*awardIconSize*1.13
            )
            award2ImageView14.userInteractionEnabled = true
            scrView.addSubview(award2ImageView14)
        }
        
        // 15
        if !items[14].award1.isEmpty {
            var award1Image15:UIImage!
            
            switch awards[Int(items[14].award1[0])].level {
            case 1:
                award1Image15 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image15 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image15 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView15 = UIImageView(frame: CGRectMake(0,0,itemImageView15.frame.width*awardIconSize,itemImageView15.frame.height*awardIconSize))
            award1ImageView15.tag = 0
            award1ImageView15.image = award1Image15
            award1ImageView15.layer.position = CGPoint(
                x: itemImageView15.frame.maxX - itemImageView15.frame.width*awardIconSize/2,
                y: itemImageView15.frame.minY + itemImageView15.frame.height*awardIconSize/2
            )
            award1ImageView15.userInteractionEnabled = true
            scrView.addSubview(award1ImageView15)
        }
        if !items[14].award2.isEmpty {
            var award2Image15:UIImage!
            
            switch awards[Int(items[14].award2[0])].level {
            case 1:
                award2Image15 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image15 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image15 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView15 = UIImageView(frame: CGRectMake(0,0,itemImageView15.frame.width*awardIconSize,itemImageView15.frame.height*awardIconSize))
            award2ImageView15.tag = 0
            award2ImageView15.image = award2Image15
            award2ImageView15.layer.position = CGPoint(
                x: itemImageView15.frame.maxX - itemImageView15.frame.width*awardIconSize/2,
                y: itemImageView15.frame.minY + itemImageView15.frame.height*awardIconSize*1.14
            )
            award2ImageView15.userInteractionEnabled = true
            scrView.addSubview(award2ImageView15)
        }
        
        // 16
        if !items[15].award1.isEmpty {
            var award1Image16:UIImage!
            
            switch awards[Int(items[15].award1[0])].level {
            case 1:
                award1Image16 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image16 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image16 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView16 = UIImageView(frame: CGRectMake(0,0,itemImageView16.frame.width*awardIconSize,itemImageView16.frame.height*awardIconSize))
            award1ImageView16.tag = 0
            award1ImageView16.image = award1Image16
            award1ImageView16.layer.position = CGPoint(
                x: itemImageView16.frame.maxX - itemImageView16.frame.width*awardIconSize/2,
                y: itemImageView16.frame.minY + itemImageView16.frame.height*awardIconSize/2
            )
            award1ImageView16.userInteractionEnabled = true
            scrView.addSubview(award1ImageView16)
        }
        if !items[15].award2.isEmpty {
            var award2Image16:UIImage!
            
            switch awards[Int(items[15].award2[0])].level {
            case 1:
                award2Image16 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image16 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image16 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView16 = UIImageView(frame: CGRectMake(0,0,itemImageView16.frame.width*awardIconSize,itemImageView16.frame.height*awardIconSize))
            award2ImageView16.tag = 0
            award2ImageView16.image = award2Image16
            award2ImageView16.layer.position = CGPoint(
                x: itemImageView16.frame.maxX - itemImageView16.frame.width*awardIconSize/2,
                y: itemImageView16.frame.minY + itemImageView16.frame.height*awardIconSize*1.15
            )
            award2ImageView16.userInteractionEnabled = true
            scrView.addSubview(award2ImageView16)
        }
        
        // 17
        if !items[16].award1.isEmpty {
            var award1Image17:UIImage!
            
            switch awards[Int(items[16].award1[0])].level {
            case 1:
                award1Image17 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image17 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image17 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView17 = UIImageView(frame: CGRectMake(0,0,itemImageView17.frame.width*awardIconSize,itemImageView17.frame.height*awardIconSize))
            award1ImageView17.tag = 0
            award1ImageView17.image = award1Image17
            award1ImageView17.layer.position = CGPoint(
                x: itemImageView17.frame.maxX - itemImageView17.frame.width*awardIconSize/2,
                y: itemImageView17.frame.minY + itemImageView17.frame.height*awardIconSize/2
            )
            award1ImageView17.userInteractionEnabled = true
            scrView.addSubview(award1ImageView17)
        }
        if !items[16].award2.isEmpty {
            var award2Image17:UIImage!
            
            switch awards[Int(items[16].award2[0])].level {
            case 1:
                award2Image17 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image17 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image17 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView17 = UIImageView(frame: CGRectMake(0,0,itemImageView17.frame.width*awardIconSize,itemImageView17.frame.height*awardIconSize))
            award2ImageView17.tag = 0
            award2ImageView17.image = award2Image17
            award2ImageView17.layer.position = CGPoint(
                x: itemImageView17.frame.maxX - itemImageView17.frame.width*awardIconSize/2,
                y: itemImageView17.frame.minY + itemImageView17.frame.height*awardIconSize*1.16
            )
            award2ImageView17.userInteractionEnabled = true
            scrView.addSubview(award2ImageView17)
        }
        
        // 18
        if !items[17].award1.isEmpty {
            var award1Image18:UIImage!
            
            switch awards[Int(items[17].award1[0])].level {
            case 1:
                award1Image18 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image18 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image18 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView18 = UIImageView(frame: CGRectMake(0,0,itemImageView18.frame.width*awardIconSize,itemImageView18.frame.height*awardIconSize))
            award1ImageView18.tag = 0
            award1ImageView18.image = award1Image18
            award1ImageView18.layer.position = CGPoint(
                x: itemImageView18.frame.maxX - itemImageView18.frame.width*awardIconSize/2,
                y: itemImageView18.frame.minY + itemImageView18.frame.height*awardIconSize/2
            )
            award1ImageView18.userInteractionEnabled = true
            scrView.addSubview(award1ImageView18)
        }
        if !items[17].award2.isEmpty {
            var award2Image18:UIImage!
            
            switch awards[Int(items[17].award2[0])].level {
            case 1:
                award2Image18 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image18 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image18 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView18 = UIImageView(frame: CGRectMake(0,0,itemImageView18.frame.width*awardIconSize,itemImageView18.frame.height*awardIconSize))
            award2ImageView18.tag = 0
            award2ImageView18.image = award2Image18
            award2ImageView18.layer.position = CGPoint(
                x: itemImageView18.frame.maxX - itemImageView18.frame.width*awardIconSize/2,
                y: itemImageView18.frame.minY + itemImageView18.frame.height*awardIconSize*1.17
            )
            award2ImageView18.userInteractionEnabled = true
            scrView.addSubview(award2ImageView18)
        }
        
        // 19
        if !items[18].award1.isEmpty {
            var award1Image19:UIImage!
            
            switch awards[Int(items[18].award1[0])].level {
            case 1:
                award1Image19 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image19 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image19 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView19 = UIImageView(frame: CGRectMake(0,0,itemImageView19.frame.width*awardIconSize,itemImageView19.frame.height*awardIconSize))
            award1ImageView19.tag = 0
            award1ImageView19.image = award1Image19
            award1ImageView19.layer.position = CGPoint(
                x: itemImageView19.frame.maxX - itemImageView19.frame.width*awardIconSize/2,
                y: itemImageView19.frame.minY + itemImageView19.frame.height*awardIconSize/2
            )
            award1ImageView19.userInteractionEnabled = true
            scrView.addSubview(award1ImageView19)
        }
        if !items[18].award2.isEmpty {
            var award2Image19:UIImage!
            
            switch awards[Int(items[18].award2[0])].level {
            case 1:
                award2Image19 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image19 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image19 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView19 = UIImageView(frame: CGRectMake(0,0,itemImageView19.frame.width*awardIconSize,itemImageView19.frame.height*awardIconSize))
            award2ImageView19.tag = 0
            award2ImageView19.image = award2Image19
            award2ImageView19.layer.position = CGPoint(
                x: itemImageView19.frame.maxX - itemImageView19.frame.width*awardIconSize/2,
                y: itemImageView19.frame.minY + itemImageView19.frame.height*awardIconSize*1.18
            )
            award2ImageView19.userInteractionEnabled = true
            scrView.addSubview(award2ImageView19)
        }
        
        // 20
        if !items[19].award1.isEmpty {
            var award1Image20:UIImage!
            
            switch awards[Int(items[19].award1[0])].level {
            case 1:
                award1Image20 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image20 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image20 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView20 = UIImageView(frame: CGRectMake(0,0,itemImageView20.frame.width*awardIconSize,itemImageView20.frame.height*awardIconSize))
            award1ImageView20.tag = 0
            award1ImageView20.image = award1Image20
            award1ImageView20.layer.position = CGPoint(
                x: itemImageView20.frame.maxX - itemImageView20.frame.width*awardIconSize/2,
                y: itemImageView20.frame.minY + itemImageView20.frame.height*awardIconSize/2
            )
            award1ImageView20.userInteractionEnabled = true
            scrView.addSubview(award1ImageView20)
        }
        if !items[19].award2.isEmpty {
            var award2Image20:UIImage!
            
            switch awards[Int(items[19].award2[0])].level {
            case 1:
                award2Image20 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image20 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image20 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView20 = UIImageView(frame: CGRectMake(0,0,itemImageView20.frame.width*awardIconSize,itemImageView20.frame.height*awardIconSize))
            award2ImageView20.tag = 0
            award2ImageView20.image = award2Image20
            award2ImageView20.layer.position = CGPoint(
                x: itemImageView20.frame.maxX - itemImageView20.frame.width*awardIconSize/2,
                y: itemImageView20.frame.minY + itemImageView20.frame.height*awardIconSize*1.19
            )
            award2ImageView20.userInteractionEnabled = true
            scrView.addSubview(award2ImageView20)
        }
        
        // 21
        if !items[20].award1.isEmpty {
            var award1Image21:UIImage!
            
            switch awards[Int(items[20].award1[0])].level {
            case 1:
                award1Image21 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image21 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image21 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView21 = UIImageView(frame: CGRectMake(0,0,itemImageView21.frame.width*awardIconSize,itemImageView21.frame.height*awardIconSize))
            award1ImageView21.tag = 0
            award1ImageView21.image = award1Image21
            award1ImageView21.layer.position = CGPoint(
                x: itemImageView21.frame.maxX - itemImageView21.frame.width*awardIconSize/2,
                y: itemImageView21.frame.minY + itemImageView21.frame.height*awardIconSize/2
            )
            award1ImageView21.userInteractionEnabled = true
            scrView.addSubview(award1ImageView21)
        }
        if !items[20].award2.isEmpty {
            var award2Image21:UIImage!
            
            switch awards[Int(items[20].award2[0])].level {
            case 1:
                award2Image21 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image21 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image21 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView21 = UIImageView(frame: CGRectMake(0,0,itemImageView21.frame.width*awardIconSize,itemImageView21.frame.height*awardIconSize))
            award2ImageView21.tag = 0
            award2ImageView21.image = award2Image21
            award2ImageView21.layer.position = CGPoint(
                x: itemImageView21.frame.maxX - itemImageView21.frame.width*awardIconSize/2,
                y: itemImageView21.frame.minY + itemImageView21.frame.height*awardIconSize*1.20
            )
            award2ImageView21.userInteractionEnabled = true
            scrView.addSubview(award2ImageView21)
        }
        
        // 22
        if !items[21].award1.isEmpty {
            var award1Image22:UIImage!
            
            switch awards[Int(items[21].award1[0])].level {
            case 1:
                award1Image22 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image22 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image22 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView22 = UIImageView(frame: CGRectMake(0,0,itemImageView22.frame.width*awardIconSize,itemImageView22.frame.height*awardIconSize))
            award1ImageView22.tag = 0
            award1ImageView22.image = award1Image22
            award1ImageView22.layer.position = CGPoint(
                x: itemImageView22.frame.maxX - itemImageView22.frame.width*awardIconSize/2,
                y: itemImageView22.frame.minY + itemImageView22.frame.height*awardIconSize/2
            )
            award1ImageView22.userInteractionEnabled = true
            scrView.addSubview(award1ImageView22)
        }
        if !items[21].award2.isEmpty {
            var award2Image22:UIImage!
            
            switch awards[Int(items[21].award2[0])].level {
            case 1:
                award2Image22 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image22 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image22 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView22 = UIImageView(frame: CGRectMake(0,0,itemImageView22.frame.width*awardIconSize,itemImageView22.frame.height*awardIconSize))
            award2ImageView22.tag = 0
            award2ImageView22.image = award2Image22
            award2ImageView22.layer.position = CGPoint(
                x: itemImageView22.frame.maxX - itemImageView22.frame.width*awardIconSize/2,
                y: itemImageView22.frame.minY + itemImageView22.frame.height*awardIconSize*1.21
            )
            award2ImageView22.userInteractionEnabled = true
            scrView.addSubview(award2ImageView22)
        }
        
        // 23
        if !items[22].award1.isEmpty {
            var award1Image23:UIImage!
            
            switch awards[Int(items[22].award1[0])].level {
            case 1:
                award1Image23 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image23 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image23 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView23 = UIImageView(frame: CGRectMake(0,0,itemImageView23.frame.width*awardIconSize,itemImageView23.frame.height*awardIconSize))
            award1ImageView23.tag = 0
            award1ImageView23.image = award1Image23
            award1ImageView23.layer.position = CGPoint(
                x: itemImageView23.frame.maxX - itemImageView23.frame.width*awardIconSize/2,
                y: itemImageView23.frame.minY + itemImageView23.frame.height*awardIconSize/2
            )
            award1ImageView23.userInteractionEnabled = true
            scrView.addSubview(award1ImageView23)
        }
        if !items[22].award2.isEmpty {
            var award2Image23:UIImage!
            
            switch awards[Int(items[22].award2[0])].level {
            case 1:
                award2Image23 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image23 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image23 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView23 = UIImageView(frame: CGRectMake(0,0,itemImageView23.frame.width*awardIconSize,itemImageView23.frame.height*awardIconSize))
            award2ImageView23.tag = 0
            award2ImageView23.image = award2Image23
            award2ImageView23.layer.position = CGPoint(
                x: itemImageView23.frame.maxX - itemImageView23.frame.width*awardIconSize/2,
                y: itemImageView23.frame.minY + itemImageView23.frame.height*awardIconSize*1.22
            )
            award2ImageView23.userInteractionEnabled = true
            scrView.addSubview(award2ImageView23)
        }
        
        // 24
        if !items[23].award1.isEmpty {
            var award1Image24:UIImage!
            
            switch awards[Int(items[23].award1[0])].level {
            case 1:
                award1Image24 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image24 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image24 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView24 = UIImageView(frame: CGRectMake(0,0,itemImageView24.frame.width*awardIconSize,itemImageView24.frame.height*awardIconSize))
            award1ImageView24.tag = 0
            award1ImageView24.image = award1Image24
            award1ImageView24.layer.position = CGPoint(
                x: itemImageView24.frame.maxX - itemImageView24.frame.width*awardIconSize/2,
                y: itemImageView24.frame.minY + itemImageView24.frame.height*awardIconSize/2
            )
            award1ImageView24.userInteractionEnabled = true
            scrView.addSubview(award1ImageView24)
        }
        if !items[23].award2.isEmpty {
            var award2Image24:UIImage!
            
            switch awards[Int(items[23].award2[0])].level {
            case 1:
                award2Image24 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image24 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image24 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView24 = UIImageView(frame: CGRectMake(0,0,itemImageView24.frame.width*awardIconSize,itemImageView24.frame.height*awardIconSize))
            award2ImageView24.tag = 0
            award2ImageView24.image = award2Image24
            award2ImageView24.layer.position = CGPoint(
                x: itemImageView24.frame.maxX - itemImageView24.frame.width*awardIconSize/2,
                y: itemImageView24.frame.minY + itemImageView24.frame.height*awardIconSize*1.23
            )
            award2ImageView24.userInteractionEnabled = true
            scrView.addSubview(award2ImageView24)
        }
        
        // 25
        if !items[24].award1.isEmpty {
            var award1Image25:UIImage!
            
            switch awards[Int(items[24].award1[0])].level {
            case 1:
                award1Image25 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image25 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image25 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView25 = UIImageView(frame: CGRectMake(0,0,itemImageView25.frame.width*awardIconSize,itemImageView25.frame.height*awardIconSize))
            award1ImageView25.tag = 0
            award1ImageView25.image = award1Image25
            award1ImageView25.layer.position = CGPoint(
                x: itemImageView25.frame.maxX - itemImageView25.frame.width*awardIconSize/2,
                y: itemImageView25.frame.minY + itemImageView25.frame.height*awardIconSize/2
            )
            award1ImageView25.userInteractionEnabled = true
            scrView.addSubview(award1ImageView25)
        }
        if !items[24].award2.isEmpty {
            var award2Image25:UIImage!
            
            switch awards[Int(items[24].award2[0])].level {
            case 1:
                award2Image25 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image25 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image25 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView25 = UIImageView(frame: CGRectMake(0,0,itemImageView25.frame.width*awardIconSize,itemImageView25.frame.height*awardIconSize))
            award2ImageView25.tag = 0
            award2ImageView25.image = award2Image25
            award2ImageView25.layer.position = CGPoint(
                x: itemImageView25.frame.maxX - itemImageView25.frame.width*awardIconSize/2,
                y: itemImageView25.frame.minY + itemImageView25.frame.height*awardIconSize*1.24
            )
            award2ImageView25.userInteractionEnabled = true
            scrView.addSubview(award2ImageView25)
        }
        
        // 26
        if !items[25].award1.isEmpty {
            var award1Image26:UIImage!
            
            switch awards[Int(items[25].award1[0])].level {
            case 1:
                award1Image26 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image26 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image26 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView26 = UIImageView(frame: CGRectMake(0,0,itemImageView26.frame.width*awardIconSize,itemImageView26.frame.height*awardIconSize))
            award1ImageView26.tag = 0
            award1ImageView26.image = award1Image26
            award1ImageView26.layer.position = CGPoint(
                x: itemImageView26.frame.maxX - itemImageView26.frame.width*awardIconSize/2,
                y: itemImageView26.frame.minY + itemImageView26.frame.height*awardIconSize/2
            )
            award1ImageView26.userInteractionEnabled = true
            scrView.addSubview(award1ImageView26)
        }
        if !items[25].award2.isEmpty {
            var award2Image26:UIImage!
            
            switch awards[Int(items[25].award2[0])].level {
            case 1:
                award2Image26 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image26 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image26 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView26 = UIImageView(frame: CGRectMake(0,0,itemImageView26.frame.width*awardIconSize,itemImageView26.frame.height*awardIconSize))
            award2ImageView26.tag = 0
            award2ImageView26.image = award2Image26
            award2ImageView26.layer.position = CGPoint(
                x: itemImageView26.frame.maxX - itemImageView26.frame.width*awardIconSize/2,
                y: itemImageView26.frame.minY + itemImageView26.frame.height*awardIconSize*1.25
            )
            award2ImageView26.userInteractionEnabled = true
            scrView.addSubview(award2ImageView26)
        }
        
        // 27
        if !items[26].award1.isEmpty {
            var award1Image27:UIImage!
            
            switch awards[Int(items[26].award1[0])].level {
            case 1:
                award1Image27 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image27 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image27 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView27 = UIImageView(frame: CGRectMake(0,0,itemImageView27.frame.width*awardIconSize,itemImageView27.frame.height*awardIconSize))
            award1ImageView27.tag = 0
            award1ImageView27.image = award1Image27
            award1ImageView27.layer.position = CGPoint(
                x: itemImageView27.frame.maxX - itemImageView27.frame.width*awardIconSize/2,
                y: itemImageView27.frame.minY + itemImageView27.frame.height*awardIconSize/2
            )
            award1ImageView27.userInteractionEnabled = true
            scrView.addSubview(award1ImageView27)
        }
        if !items[26].award2.isEmpty {
            var award2Image27:UIImage!
            
            switch awards[Int(items[26].award2[0])].level {
            case 1:
                award2Image27 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image27 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image27 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView27 = UIImageView(frame: CGRectMake(0,0,itemImageView27.frame.width*awardIconSize,itemImageView27.frame.height*awardIconSize))
            award2ImageView27.tag = 0
            award2ImageView27.image = award2Image27
            award2ImageView27.layer.position = CGPoint(
                x: itemImageView27.frame.maxX - itemImageView27.frame.width*awardIconSize/2,
                y: itemImageView27.frame.minY + itemImageView27.frame.height*awardIconSize*1.26
            )
            award2ImageView27.userInteractionEnabled = true
            scrView.addSubview(award2ImageView27)
        }
        
        // 28
        if !items[27].award1.isEmpty {
            var award1Image28:UIImage!
            
            switch awards[Int(items[27].award1[0])].level {
            case 1:
                award1Image28 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image28 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image28 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView28 = UIImageView(frame: CGRectMake(0,0,itemImageView28.frame.width*awardIconSize,itemImageView28.frame.height*awardIconSize))
            award1ImageView28.tag = 0
            award1ImageView28.image = award1Image28
            award1ImageView28.layer.position = CGPoint(
                x: itemImageView28.frame.maxX - itemImageView28.frame.width*awardIconSize/2,
                y: itemImageView28.frame.minY + itemImageView28.frame.height*awardIconSize/2
            )
            award1ImageView28.userInteractionEnabled = true
            scrView.addSubview(award1ImageView28)
        }
        if !items[27].award2.isEmpty {
            var award2Image28:UIImage!
            
            switch awards[Int(items[27].award2[0])].level {
            case 1:
                award2Image28 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image28 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image28 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView28 = UIImageView(frame: CGRectMake(0,0,itemImageView28.frame.width*awardIconSize,itemImageView28.frame.height*awardIconSize))
            award2ImageView28.tag = 0
            award2ImageView28.image = award2Image28
            award2ImageView28.layer.position = CGPoint(
                x: itemImageView28.frame.maxX - itemImageView28.frame.width*awardIconSize/2,
                y: itemImageView28.frame.minY + itemImageView28.frame.height*awardIconSize*1.27
            )
            award2ImageView28.userInteractionEnabled = true
            scrView.addSubview(award2ImageView28)
        }
        
        // 29
        if !items[28].award1.isEmpty {
            var award1Image29:UIImage!
            
            switch awards[Int(items[28].award1[0])].level {
            case 1:
                award1Image29 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image29 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image29 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView29 = UIImageView(frame: CGRectMake(0,0,itemImageView29.frame.width*awardIconSize,itemImageView29.frame.height*awardIconSize))
            award1ImageView29.tag = 0
            award1ImageView29.image = award1Image29
            award1ImageView29.layer.position = CGPoint(
                x: itemImageView29.frame.maxX - itemImageView29.frame.width*awardIconSize/2,
                y: itemImageView29.frame.minY + itemImageView29.frame.height*awardIconSize/2
            )
            award1ImageView29.userInteractionEnabled = true
            scrView.addSubview(award1ImageView29)
        }
        if !items[28].award2.isEmpty {
            var award2Image29:UIImage!
            
            switch awards[Int(items[28].award2[0])].level {
            case 1:
                award2Image29 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image29 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image29 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView29 = UIImageView(frame: CGRectMake(0,0,itemImageView29.frame.width*awardIconSize,itemImageView29.frame.height*awardIconSize))
            award2ImageView29.tag = 0
            award2ImageView29.image = award2Image29
            award2ImageView29.layer.position = CGPoint(
                x: itemImageView29.frame.maxX - itemImageView29.frame.width*awardIconSize/2,
                y: itemImageView29.frame.minY + itemImageView29.frame.height*awardIconSize*1.28
            )
            award2ImageView29.userInteractionEnabled = true
            scrView.addSubview(award2ImageView29)
        }
        
        // 30
        if !items[29].award1.isEmpty {
            var award1Image30:UIImage!
            
            switch awards[Int(items[29].award1[0])].level {
            case 1:
                award1Image30 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image30 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image30 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView30 = UIImageView(frame: CGRectMake(0,0,itemImageView30.frame.width*awardIconSize,itemImageView30.frame.height*awardIconSize))
            award1ImageView30.tag = 0
            award1ImageView30.image = award1Image30
            award1ImageView30.layer.position = CGPoint(
                x: itemImageView30.frame.maxX - itemImageView30.frame.width*awardIconSize/2,
                y: itemImageView30.frame.minY + itemImageView30.frame.height*awardIconSize/2
            )
            award1ImageView30.userInteractionEnabled = true
            scrView.addSubview(award1ImageView30)
        }
        if !items[29].award2.isEmpty {
            var award2Image30:UIImage!
            
            switch awards[Int(items[29].award2[0])].level {
            case 1:
                award2Image30 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image30 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image30 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView30 = UIImageView(frame: CGRectMake(0,0,itemImageView30.frame.width*awardIconSize,itemImageView30.frame.height*awardIconSize))
            award2ImageView30.tag = 0
            award2ImageView30.image = award2Image30
            award2ImageView30.layer.position = CGPoint(
                x: itemImageView30.frame.maxX - itemImageView30.frame.width*awardIconSize/2,
                y: itemImageView30.frame.minY + itemImageView30.frame.height*awardIconSize*1.29
            )
            award2ImageView30.userInteractionEnabled = true
            scrView.addSubview(award2ImageView30)
        }
        
        // 31
        if !items[30].award1.isEmpty {
            var award1Image31:UIImage!
            
            switch awards[Int(items[30].award1[0])].level {
            case 1:
                award1Image31 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image31 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image31 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView31 = UIImageView(frame: CGRectMake(0,0,itemImageView31.frame.width*awardIconSize,itemImageView31.frame.height*awardIconSize))
            award1ImageView31.tag = 0
            award1ImageView31.image = award1Image31
            award1ImageView31.layer.position = CGPoint(
                x: itemImageView31.frame.maxX - itemImageView31.frame.width*awardIconSize/2,
                y: itemImageView31.frame.minY + itemImageView31.frame.height*awardIconSize/2
            )
            award1ImageView31.userInteractionEnabled = true
            scrView.addSubview(award1ImageView31)
        }
        if !items[30].award2.isEmpty {
            var award2Image31:UIImage!
            
            switch awards[Int(items[30].award2[0])].level {
            case 1:
                award2Image31 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image31 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image31 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView31 = UIImageView(frame: CGRectMake(0,0,itemImageView31.frame.width*awardIconSize,itemImageView31.frame.height*awardIconSize))
            award2ImageView31.tag = 0
            award2ImageView31.image = award2Image31
            award2ImageView31.layer.position = CGPoint(
                x: itemImageView31.frame.maxX - itemImageView31.frame.width*awardIconSize/2,
                y: itemImageView31.frame.minY + itemImageView31.frame.height*awardIconSize*1.30
            )
            award2ImageView31.userInteractionEnabled = true
            scrView.addSubview(award2ImageView31)
        }
        
        // 32
        if !items[31].award1.isEmpty {
            var award1Image32:UIImage!
            
            switch awards[Int(items[31].award1[0])].level {
            case 1:
                award1Image32 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image32 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image32 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView32 = UIImageView(frame: CGRectMake(0,0,itemImageView32.frame.width*awardIconSize,itemImageView32.frame.height*awardIconSize))
            award1ImageView32.tag = 0
            award1ImageView32.image = award1Image32
            award1ImageView32.layer.position = CGPoint(
                x: itemImageView32.frame.maxX - itemImageView32.frame.width*awardIconSize/2,
                y: itemImageView32.frame.minY + itemImageView32.frame.height*awardIconSize/2
            )
            award1ImageView32.userInteractionEnabled = true
            scrView.addSubview(award1ImageView32)
        }
        if !items[31].award2.isEmpty {
            var award2Image32:UIImage!
            
            switch awards[Int(items[31].award2[0])].level {
            case 1:
                award2Image32 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image32 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image32 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView32 = UIImageView(frame: CGRectMake(0,0,itemImageView32.frame.width*awardIconSize,itemImageView32.frame.height*awardIconSize))
            award2ImageView32.tag = 0
            award2ImageView32.image = award2Image32
            award2ImageView32.layer.position = CGPoint(
                x: itemImageView32.frame.maxX - itemImageView32.frame.width*awardIconSize/2,
                y: itemImageView32.frame.minY + itemImageView32.frame.height*awardIconSize*1.31
            )
            award2ImageView32.userInteractionEnabled = true
            scrView.addSubview(award2ImageView32)
        }
        
        // 33
        if !items[32].award1.isEmpty {
            var award1Image33:UIImage!
            
            switch awards[Int(items[32].award1[0])].level {
            case 1:
                award1Image33 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image33 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image33 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView33 = UIImageView(frame: CGRectMake(0,0,itemImageView33.frame.width*awardIconSize,itemImageView33.frame.height*awardIconSize))
            award1ImageView33.tag = 0
            award1ImageView33.image = award1Image33
            award1ImageView33.layer.position = CGPoint(
                x: itemImageView33.frame.maxX - itemImageView33.frame.width*awardIconSize/2,
                y: itemImageView33.frame.minY + itemImageView33.frame.height*awardIconSize/2
            )
            award1ImageView33.userInteractionEnabled = true
            scrView.addSubview(award1ImageView33)
        }
        if !items[32].award2.isEmpty {
            var award2Image33:UIImage!
            
            switch awards[Int(items[32].award2[0])].level {
            case 1:
                award2Image33 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image33 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image33 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView33 = UIImageView(frame: CGRectMake(0,0,itemImageView33.frame.width*awardIconSize,itemImageView33.frame.height*awardIconSize))
            award2ImageView33.tag = 0
            award2ImageView33.image = award2Image33
            award2ImageView33.layer.position = CGPoint(
                x: itemImageView33.frame.maxX - itemImageView33.frame.width*awardIconSize/2,
                y: itemImageView33.frame.minY + itemImageView33.frame.height*awardIconSize*1.32
            )
            award2ImageView33.userInteractionEnabled = true
            scrView.addSubview(award2ImageView33)
        }
        
        // 34
        if !items[33].award1.isEmpty {
            var award1Image34:UIImage!
            
            switch awards[Int(items[33].award1[0])].level {
            case 1:
                award1Image34 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image34 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image34 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView34 = UIImageView(frame: CGRectMake(0,0,itemImageView34.frame.width*awardIconSize,itemImageView34.frame.height*awardIconSize))
            award1ImageView34.tag = 0
            award1ImageView34.image = award1Image34
            award1ImageView34.layer.position = CGPoint(
                x: itemImageView34.frame.maxX - itemImageView34.frame.width*awardIconSize/2,
                y: itemImageView34.frame.minY + itemImageView34.frame.height*awardIconSize/2
            )
            award1ImageView34.userInteractionEnabled = true
            scrView.addSubview(award1ImageView34)
        }
        if !items[33].award2.isEmpty {
            var award2Image34:UIImage!
            
            switch awards[Int(items[33].award2[0])].level {
            case 1:
                award2Image34 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image34 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image34 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView34 = UIImageView(frame: CGRectMake(0,0,itemImageView34.frame.width*awardIconSize,itemImageView34.frame.height*awardIconSize))
            award2ImageView34.tag = 0
            award2ImageView34.image = award2Image34
            award2ImageView34.layer.position = CGPoint(
                x: itemImageView34.frame.maxX - itemImageView34.frame.width*awardIconSize/2,
                y: itemImageView34.frame.minY + itemImageView34.frame.height*awardIconSize*1.33
            )
            award2ImageView34.userInteractionEnabled = true
            scrView.addSubview(award2ImageView34)
        }
        
        // 35
        if !items[34].award1.isEmpty {
            var award1Image35:UIImage!
            
            switch awards[Int(items[34].award1[0])].level {
            case 1:
                award1Image35 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image35 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image35 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView35 = UIImageView(frame: CGRectMake(0,0,itemImageView35.frame.width*awardIconSize,itemImageView35.frame.height*awardIconSize))
            award1ImageView35.tag = 0
            award1ImageView35.image = award1Image35
            award1ImageView35.layer.position = CGPoint(
                x: itemImageView35.frame.maxX - itemImageView35.frame.width*awardIconSize/2,
                y: itemImageView35.frame.minY + itemImageView35.frame.height*awardIconSize/2
            )
            award1ImageView35.userInteractionEnabled = true
            scrView.addSubview(award1ImageView35)
        }
        if !items[34].award2.isEmpty {
            var award2Image35:UIImage!
            
            switch awards[Int(items[34].award2[0])].level {
            case 1:
                award2Image35 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image35 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image35 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView35 = UIImageView(frame: CGRectMake(0,0,itemImageView35.frame.width*awardIconSize,itemImageView35.frame.height*awardIconSize))
            award2ImageView35.tag = 0
            award2ImageView35.image = award2Image35
            award2ImageView35.layer.position = CGPoint(
                x: itemImageView35.frame.maxX - itemImageView35.frame.width*awardIconSize/2,
                y: itemImageView35.frame.minY + itemImageView35.frame.height*awardIconSize*1.34
            )
            award2ImageView35.userInteractionEnabled = true
            scrView.addSubview(award2ImageView35)
        }
        
        // 36
        if !items[35].award1.isEmpty {
            var award1Image36:UIImage!
            
            switch awards[Int(items[35].award1[0])].level {
            case 1:
                award1Image36 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image36 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image36 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView36 = UIImageView(frame: CGRectMake(0,0,itemImageView36.frame.width*awardIconSize,itemImageView36.frame.height*awardIconSize))
            award1ImageView36.tag = 0
            award1ImageView36.image = award1Image36
            award1ImageView36.layer.position = CGPoint(
                x: itemImageView36.frame.maxX - itemImageView36.frame.width*awardIconSize/2,
                y: itemImageView36.frame.minY + itemImageView36.frame.height*awardIconSize/2
            )
            award1ImageView36.userInteractionEnabled = true
            scrView.addSubview(award1ImageView36)
        }
        if !items[35].award2.isEmpty {
            var award2Image36:UIImage!
            
            switch awards[Int(items[35].award2[0])].level {
            case 1:
                award2Image36 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image36 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image36 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView36 = UIImageView(frame: CGRectMake(0,0,itemImageView36.frame.width*awardIconSize,itemImageView36.frame.height*awardIconSize))
            award2ImageView36.tag = 0
            award2ImageView36.image = award2Image36
            award2ImageView36.layer.position = CGPoint(
                x: itemImageView36.frame.maxX - itemImageView36.frame.width*awardIconSize/2,
                y: itemImageView36.frame.minY + itemImageView36.frame.height*awardIconSize*1.35
            )
            award2ImageView36.userInteractionEnabled = true
            scrView.addSubview(award2ImageView36)
        }
        
        // 37
        if !items[36].award1.isEmpty {
            var award1Image37:UIImage!
            
            switch awards[Int(items[36].award1[0])].level {
            case 1:
                award1Image37 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image37 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image37 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView37 = UIImageView(frame: CGRectMake(0,0,itemImageView37.frame.width*awardIconSize,itemImageView37.frame.height*awardIconSize))
            award1ImageView37.tag = 0
            award1ImageView37.image = award1Image37
            award1ImageView37.layer.position = CGPoint(
                x: itemImageView37.frame.maxX - itemImageView37.frame.width*awardIconSize/2,
                y: itemImageView37.frame.minY + itemImageView37.frame.height*awardIconSize/2
            )
            award1ImageView37.userInteractionEnabled = true
            scrView.addSubview(award1ImageView37)
        }
        if !items[36].award2.isEmpty {
            var award2Image37:UIImage!
            
            switch awards[Int(items[36].award2[0])].level {
            case 1:
                award2Image37 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image37 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image37 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView37 = UIImageView(frame: CGRectMake(0,0,itemImageView37.frame.width*awardIconSize,itemImageView37.frame.height*awardIconSize))
            award2ImageView37.tag = 0
            award2ImageView37.image = award2Image37
            award2ImageView37.layer.position = CGPoint(
                x: itemImageView37.frame.maxX - itemImageView37.frame.width*awardIconSize/2,
                y: itemImageView37.frame.minY + itemImageView37.frame.height*awardIconSize*1.36
            )
            award2ImageView37.userInteractionEnabled = true
            scrView.addSubview(award2ImageView37)
        }
        
        // 38
        if !items[37].award1.isEmpty {
            var award1Image38:UIImage!
            
            switch awards[Int(items[37].award1[0])].level {
            case 1:
                award1Image38 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image38 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image38 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView38 = UIImageView(frame: CGRectMake(0,0,itemImageView38.frame.width*awardIconSize,itemImageView38.frame.height*awardIconSize))
            award1ImageView38.tag = 0
            award1ImageView38.image = award1Image38
            award1ImageView38.layer.position = CGPoint(
                x: itemImageView38.frame.maxX - itemImageView38.frame.width*awardIconSize/2,
                y: itemImageView38.frame.minY + itemImageView38.frame.height*awardIconSize/2
            )
            award1ImageView38.userInteractionEnabled = true
            scrView.addSubview(award1ImageView38)
        }
        if !items[37].award2.isEmpty {
            var award2Image38:UIImage!
            
            switch awards[Int(items[37].award2[0])].level {
            case 1:
                award2Image38 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image38 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image38 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView38 = UIImageView(frame: CGRectMake(0,0,itemImageView38.frame.width*awardIconSize,itemImageView38.frame.height*awardIconSize))
            award2ImageView38.tag = 0
            award2ImageView38.image = award2Image38
            award2ImageView38.layer.position = CGPoint(
                x: itemImageView38.frame.maxX - itemImageView38.frame.width*awardIconSize/2,
                y: itemImageView38.frame.minY + itemImageView38.frame.height*awardIconSize*1.37
            )
            award2ImageView38.userInteractionEnabled = true
            scrView.addSubview(award2ImageView38)
        }
        
        // 39
        if !items[38].award1.isEmpty {
            var award1Image39:UIImage!
            
            switch awards[Int(items[38].award1[0])].level {
            case 1:
                award1Image39 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image39 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image39 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView39 = UIImageView(frame: CGRectMake(0,0,itemImageView39.frame.width*awardIconSize,itemImageView39.frame.height*awardIconSize))
            award1ImageView39.tag = 0
            award1ImageView39.image = award1Image39
            award1ImageView39.layer.position = CGPoint(
                x: itemImageView39.frame.maxX - itemImageView39.frame.width*awardIconSize/2,
                y: itemImageView39.frame.minY + itemImageView39.frame.height*awardIconSize/2
            )
            award1ImageView39.userInteractionEnabled = true
            scrView.addSubview(award1ImageView39)
        }
        if !items[38].award2.isEmpty {
            var award2Image39:UIImage!
            
            switch awards[Int(items[38].award2[0])].level {
            case 1:
                award2Image39 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image39 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image39 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView39 = UIImageView(frame: CGRectMake(0,0,itemImageView39.frame.width*awardIconSize,itemImageView39.frame.height*awardIconSize))
            award2ImageView39.tag = 0
            award2ImageView39.image = award2Image39
            award2ImageView39.layer.position = CGPoint(
                x: itemImageView39.frame.maxX - itemImageView39.frame.width*awardIconSize/2,
                y: itemImageView39.frame.minY + itemImageView39.frame.height*awardIconSize*1.38
            )
            award2ImageView39.userInteractionEnabled = true
            scrView.addSubview(award2ImageView39)
        }
        
        // 40
        if !items[39].award1.isEmpty {
            var award1Image40:UIImage!
            
            switch awards[Int(items[39].award1[0])].level {
            case 1:
                award1Image40 = UIImage(named: "Award1_1_icon")!
                
                break
            case 2:
                award1Image40 = UIImage(named: "Award1_2_icon")!
                
                break
            case 3:
                award1Image40 = UIImage(named: "Award1_3_icon")!
                
                break
            default:
                break
            }
            award1ImageView40 = UIImageView(frame: CGRectMake(0,0,itemImageView40.frame.width*awardIconSize,itemImageView40.frame.height*awardIconSize))
            award1ImageView40.tag = 0
            award1ImageView40.image = award1Image40
            award1ImageView40.layer.position = CGPoint(
                x: itemImageView40.frame.maxX - itemImageView40.frame.width*awardIconSize/2,
                y: itemImageView40.frame.minY + itemImageView40.frame.height*awardIconSize/2
            )
            award1ImageView40.userInteractionEnabled = true
            scrView.addSubview(award1ImageView40)
        }
        if !items[39].award2.isEmpty {
            var award2Image40:UIImage!
            
            switch awards[Int(items[39].award2[0])].level {
            case 1:
                award2Image40 = UIImage(named: "Award2_1_icon")!
                
                break
            case 2:
                award2Image40 = UIImage(named: "Award2_2_icon")!
                
                break
            case 3:
                award2Image40 = UIImage(named: "Award2_3_icon")!
                
                break
            default:
                break
            }
            award2ImageView40 = UIImageView(frame: CGRectMake(0,0,itemImageView01.frame.width*awardIconSize,itemImageView01.frame.height*awardIconSize))
            award2ImageView40.tag = 0
            award2ImageView40.image = award2Image40
            award2ImageView40.layer.position = CGPoint(
                x: itemImageView40.frame.maxX - itemImageView01.frame.width*awardIconSize/2,
                y: itemImageView40.frame.minY + itemImageView01.frame.height*awardIconSize*1.39
            )
            award2ImageView40.userInteractionEnabled = true
            scrView.addSubview(award2ImageView40)
        }
    }
    
    // 商品クリック時にクリックされた商品を特定する
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch = touches.first as! UITouch
        var tag:Int = touch.view.tag
        clickItem = items[tag]
        println(clickItem!.itemid)
    }
    
    // 商品クリック時に商品詳細画面に遷移する
    func onClickItemImageView(recognizer: UIGestureRecognizer) {
        println("test")
        let itemViewController: UIViewController = ItemViewController()
        navigationController?.pushViewController(itemViewController, animated: true)
    }
    
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
        }
    }
}
