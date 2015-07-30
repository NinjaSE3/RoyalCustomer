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
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationView()
        self.itemListView()
        /*
        let itemList = itemList[indexPath.row]
        let itemListViewController = ItemListViewController(itemList: itemList)
        navigationController?.itemListViewController(itemListViewController, animated: true)
        */
        
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
        self.navigationItem.title = "くらさわさん"
    }
    
    func itemListView(){
        
        // あとで全商品に展開すること！！！
        let gesture = UITapGestureRecognizer(target:self, action:"onClickItemImageView:")
        
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
        itemImageView01.addGestureRecognizer(gesture)
        
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
        itemImageView02.addGestureRecognizer(gesture)
        
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
        itemImageView03.addGestureRecognizer(gesture)
        
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
        itemImageView04.addGestureRecognizer(gesture)
        
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
        itemImageView05.addGestureRecognizer(gesture)
        
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
        itemImageView06.addGestureRecognizer(gesture)
        
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
        itemImageView07.addGestureRecognizer(gesture)
        
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
        itemImageView08.addGestureRecognizer(gesture)
        
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
        itemImageView09.addGestureRecognizer(gesture)
        
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
        itemImageView10.addGestureRecognizer(gesture)
        
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
        itemImageView11.addGestureRecognizer(gesture)

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
        itemImageView12.addGestureRecognizer(gesture)
        
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
        itemImageView13.addGestureRecognizer(gesture)
        
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
        itemImageView14.addGestureRecognizer(gesture)
        
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
        itemImageView15.addGestureRecognizer(gesture)
        
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
        itemImageView16.addGestureRecognizer(gesture)
        
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
        itemImageView17.addGestureRecognizer(gesture)
        
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
        itemImageView18.addGestureRecognizer(gesture)
        
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
        itemImageView19.addGestureRecognizer(gesture)
        
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
        itemImageView20.addGestureRecognizer(gesture)
        
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
        itemImageView21.addGestureRecognizer(gesture)
        
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
        itemImageView22.addGestureRecognizer(gesture)
        
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
        itemImageView23.addGestureRecognizer(gesture)
        
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
        itemImageView24.addGestureRecognizer(gesture)
        
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
        itemImageView25.addGestureRecognizer(gesture)
        
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
        itemImageView26.addGestureRecognizer(gesture)
        
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
        itemImageView27.addGestureRecognizer(gesture)
        
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
        itemImageView28.addGestureRecognizer(gesture)
        
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
        itemImageView29.addGestureRecognizer(gesture)
        
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
        itemImageView30.addGestureRecognizer(gesture)
        
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
        itemImageView31.addGestureRecognizer(gesture)
        
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
        itemImageView32.addGestureRecognizer(gesture)
        
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
        itemImageView33.addGestureRecognizer(gesture)
        
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
        itemImageView34.addGestureRecognizer(gesture)
        
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
        itemImageView35.addGestureRecognizer(gesture)
        
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
        itemImageView36.addGestureRecognizer(gesture)
        
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
        itemImageView37.addGestureRecognizer(gesture)
        
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
        itemImageView38.addGestureRecognizer(gesture)
        
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
        itemImageView39.addGestureRecognizer(gesture)
        
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
        itemImageView40.addGestureRecognizer(gesture)
        
        // スクロールview
        let scrView = MyScrollView()
        // ページサイズ
        scrView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        // 全体のサイズ
        scrView.contentSize = CGSizeMake(view.bounds.width, pageHeight*2)
        // 配置
        scrView.layer.position = CGPoint(
            x: scrView.frame.width/2,
            y: scrView.frame.height/2
        )
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
        //let itemViewController: UIViewController = itemViewController()
        //navigationController?.pushViewController(itemViewController, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        //var itemViewController:ItemViewController = segue.destinationViewController as ItemViewController
        //itemViewController.param = self.paramText.text
    }
    
    // 通常のScrollViewではtouchesBeganが呼ばれないため拡張
    class MyScrollView: UIScrollView {
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            superview?.touchesBegan(touches, withEvent: event)
        }
    }
}
