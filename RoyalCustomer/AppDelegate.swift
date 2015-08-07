//
//  AppDelegate.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

let account = Account()
var items     :[Item] = []
var showOrder :[NSTimeInterval] = []
var awards    :[Award] = []
// クリックされた商品
var clickItem:Item?
// クリックされた認定
var clickAward:Award?

let api = API(baseURL: NSURL(string: "https://acani-chats.herokuapp.com"))


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var myTabBarController: UITabBarController!
    
    var _chat:Chat?
    
    
    /*
    アプリケーション起動時に呼ばれるメソッド.
    */
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        //商品作成
        self.createItems()
        //商品表示順を決定
        self.createShowOrder()
        //認定作成
        self.createAwards()
        //アカウント取得
        self.continueAsGuestAction()
        
        //カラーコード作成
        primaryTextColor = UIColorFromRGB(0x212121);
        secondaryTextColor = UIColorFromRGB(0x727272);
        primaryColor = UIColorFromRGB(0x30B0FF);
        secondaryColor = UIColorFromRGB(0xB3E5FC);
        primaryBackgroundColor = UIColorFromRGB(0xF8F8F8);
        secondaryBackgroundColor = UIColorFromRGB(0xEFEFEF);
        primaryAwardColor = UIColorFromRGB(0xF3D51A);
        secondaryAwardColor = UIColorFromRGB(0xFEFCE5);
        facebookColor = UIColorFromRGB(0x3B5998);

        //フォント定義
        fontName = "HiraKakuProN-W3"
        fontNameBold = "HiraKakuProN-W6"
        
        if let accessToken = account.accessToken {
            if accessToken == "guest_access_token" {
                account.accessToken = nil
            } else {
                account.setUserWithAccessToken(accessToken, firstName: "", lastName: "")
            }
        }
        account.addObserver(self, forKeyPath: "accessToken", options: NSKeyValueObservingOptions(0), context: nil) // always
        
        // Tabに設定するViewControllerのインスタンスを生成.
        let itemListViewController: UIViewController = ItemListViewController()
        itemListViewController.tabBarItem = UITabBarItem(title: "タイムライン", image: UIImage(named: "timeline_grey_03_s"), selectedImage: UIImage(named: "timeline_03_s"))
        let chatsTableViewController: UIViewController = ChatsTableViewController()
        chatsTableViewController.tabBarItem = UITabBarItem(title: "メッセージ", image: UIImage(named: "ChatIcon_grey"), selectedImage: UIImage(named: "ChatIcon"))
        // UINavigationを設定
        let itemListNavigationController = UINavigationController(rootViewController: itemListViewController)
        itemListNavigationController.navigationBar.barTintColor = primaryColor
        itemListNavigationController.navigationBar.tintColor = primaryBackgroundColor
        
        let chatsNavigationController = UINavigationController(rootViewController: chatsTableViewController)
        chatsNavigationController.navigationBar.barTintColor = primaryColor
        chatsNavigationController.navigationBar.tintColor = primaryBackgroundColor
        
        // ナビゲーションバーの背景画像を設定
        let display: CGRect  = UIScreen.mainScreen().bounds
        var naviImage:UIImage = UIImage(named: "Nevigation-Bar")!
        if (display.size.height == 568) {   // iPhone 5 の場合
            naviImage = UIImage(named: "Nevigation-Bar")!
        } else if (display.size.height == 667) { // iPhone 6 の場合
            naviImage = UIImage(named: "Nevigation-Bar")!
        } else if (display.size.height == 736) { // iPhone 6 Plus の場合
            naviImage = UIImage(named: "Nevigation-Bar6")!
        }
        naviImage.drawInRect(CGRectMake(0, 0, itemListNavigationController.navigationBar.frame.width, itemListNavigationController.navigationBar.frame.height))
        itemListNavigationController.navigationBar.setBackgroundImage(naviImage, forBarMetrics: .Default)
        chatsNavigationController.navigationBar.setBackgroundImage(naviImage, forBarMetrics: .Default)
        
        // タブを要素に持つArrayの.を作成する.
        let myTabs = NSArray(objects: itemListNavigationController, chatsNavigationController)
        
        // UITabControllerの作成する.
        myTabBarController = UITabBarController()
        
        // ViewControllerを設定する.
        myTabBarController?.setViewControllers(myTabs as [AnyObject], animated: false)
        
        // RootViewControllerに設定する.
        self.window!.rootViewController = myTabBarController
        
        self.window!.makeKeyAndVisible()
        
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //アカウントハードコーディング
    func continueAsGuestAction() {
        (UIApplication.sharedApplication().delegate as! AppDelegate).continueAsGuest()
    }
    
    //アカウントハードコーディング
    func continueAsGuest() {
        let minute: NSTimeInterval = 60, hour = minute * 60, day = hour * 24
        account.chats = [
            Chat(user: User(ID: 17, username: "コカ・コーラ", firstName: "コカ・コーラ", lastName: "＠鈴木"), lastMessageText: "夏を変えよう、キミを変えよう。", lastMessageSentDate: NSDate()),
            Chat(user: User(ID: 1, username: "森永の焼プリン", firstName: "森永の焼プリン", lastName: "＠オフライン"), lastMessageText: "おいしいをデザインする", lastMessageSentDate: NSDate()),
            Chat(user: User(ID: 8, username: "カリカリ梅おむすび", firstName: "カリカリ梅おむすび", lastName: "＠オフライン"), lastMessageText: "混ぜ飯おむすび", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute*5)),
            Chat(user: User(ID: 3, username: "週刊少年ジャンプ", firstName: "週刊少年ジャンプ", lastName: "＠オフライン"), lastMessageText: "友情・努力・勝利", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute*12)),
            Chat(user: User(ID: 10, username: "ガツン、とみかん", firstName: "ガツン、とみかん", lastName: "＠オフライン"), lastMessageText: "夏はこっちだ！", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*5)),
            Chat(user: User(ID: 4, username: "カリカリダブルチーズ", firstName: "カリカリダブルチーズ", lastName: "＠オフライン"), lastMessageText: "カリカリとした食感のツイスト（ねじれた）形状のコーンスナックです。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*13)),
            Chat(user: User(ID: 18, username: "かっぱえびせん", firstName: "かっぱえびせん", lastName: "＠オフライン"), lastMessageText: "やめられないとまらない", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*34)),
            Chat(user: User(ID: 19, username: "キットカット", firstName: "キットカット", lastName: "＠オフライン"), lastMessageText: "ブレイクタイム", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*6)),
            Chat(user: User(ID: 13, username: "カントリーマアム", firstName: "カントリーマアム", lastName: "＠オフライン"), lastMessageText: "ホームメイドのおいしさ。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*7)),
            Chat(user: User(ID: 9, username: "ロースカツカレー", firstName: "ロースカツカレー", lastName: "＠オフライン"), lastMessageText: "食べ応えのあるジューシーなロースカツを盛り付けたカレーです。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*8))
        ]
        for chat in account.chats {
            account.users.append(chat.user)
        }
        account.phone = "4154202843"
        account.user = User(ID: 24, username: "十一時七雄", firstName: "十一時七雄", lastName: "＠元気")
        account.accessToken = "guest_access_token"
    }
    
    //商品ハードコーディング
    func createItems() {
        items.append(Item(itemid:"000017",name:"コカ・コーラ",image:"Item17",award1:[0,1,2],award2:[3,4,5], prchedHist:["2015/8":5,"2015/7":15, "2015/6":15,"2015/5":16,"2015/4":20,"2015/3":18,"2015/2":18], prchedThisM:[1:1,3:2,4:1,5:1], brandImage: "cocacola", outline:"説明１"))
        items.append(Item(itemid:"000002",name:"ムービングラバーワイルドシェイク",image:"Item2",award1:[],award2:[], prchedHist:["2015/8":3,"2015/7":1, "2015/6":2,"2015/5":1,"2015/4":1,"2015/3":1], prchedThisM:[1:1,4:1], brandImage: "Brand3_icon", outline:"ムービングラバー配合のスタイリングワックスです。立体感あふれるワイルドな動きが楽しめます。"))
        items.append(Item(itemid:"000003",name:"週刊少年ジャンプ",image:"Item3",award1:[],award2:[], prchedHist:["2015/8":1,"2015/7":4, "2015/6":4,"2015/5":3,"2015/4":4,"2015/3":4,"2015/2":4], prchedThisM:[3:1], brandImage: "Brand4_icon", outline:"説明１"))
        items.append(Item(itemid:"000004",name:"カリカリダブルチーズ",image:"Item4",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":10, "2015/6":8,"2015/5":7,"2015/4":5,"2015/3":3,"2015/2":3], prchedThisM:[1:1,2:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000005",name:"バナナ",image:"Item5",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000020",name:"パピコ（ホワイトサワー味）",image:"Item20",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand7_icon", outline:"説明１"))
        items.append(Item(itemid:"000007",name:"手巻おにぎり紀州南高梅（たたき梅）",image:"Item7",award1:[6,7],award2:[], prchedHist:["2015/8":2, "2015/7":10, "2015/6":8,"2015/5":7,"2015/4":5,"2015/3":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000008",name:"カリカリ梅おむすび",image:"Item8",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":2,"2015/5":4,"2015/4":5,"2015/3":8], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000009",name:"ロースカツカレー",image:"Item9",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000010",name:"ガツン、とみかん",image:"Item10",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000011",name:"お〜いお茶",image:"Item11",award1:[],award2:[8], prchedHist:["2015/8":2, "2015/7":14, "2015/6":13,"2015/5":15,"2015/4":9,"2015/3":10], prchedThisM:[1:1,4:1], brandImage: "Brand5_icon", outline:"説明１"))
        items.append(Item(itemid:"000012",name:"盛り合わせフルーツ",image:"Item12",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000013",name:"カントリーマアム",image:"Item13",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000001",name:"森永の焼プリン",image:"Item1",award1:[],award2:[15], prchedHist:["2015/8":5,"2015/7":10, "2015/6":9,"2015/5":8,"2015/4":12,"2015/3":7], prchedThisM:[1:1,3:2,4:1,5:1], brandImage: "Brand1_icon", outline:"カラメルソースのほろ苦さがクリーミープリンにぴったりです。\n遠赤外線オーブンで焼き上げたシンプルな味わいを、\nゆったりとリラックスしてお楽しみ下さい。"))
        items.append(Item(itemid:"000015",name:"ちょっと贅沢ミックスゼリー",image:"Item15",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000016",name:"カロリーメイト",image:"Item16",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000014",name:"力水",image:"Item14",award1:[9],award2:[10], prchedHist:["2015/8":5, "2015/7":12, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8], prchedThisM:[1:1,2:1,3:1,4:1,5:1], brandImage: "Brand6_icon", outline:"説明１"))
        items.append(Item(itemid:"000018",name:"かっぱえびせん",image:"Item18",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000019",name:"キットカット",image:"Item19",award1:[11],award2:[12], prchedHist:["2015/8":2, "2015/7":6, "2015/6":12,"2015/5":8,"2015/4":8,"2015/3":9], prchedThisM:[1:1,4:1], brandImage: "Brand8_icon", outline:"説明１"))
        items.append(Item(itemid:"000006",name:"セブンカフェ",image:"Item6",award1:[18,19,20],award2:[21], prchedHist:["2015/8":2, "2015/7":12, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000021",name:"口どけなめらか濃厚フロマージュ",image:"Item21",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":10, "2015/6":9,"2015/5":7,"2015/4":6,"2015/3":5,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000022",name:"じゃがりこ（抹茶クリーム味）",image:"Item22",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000023",name:"おでん",image:"Item23",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000024",name:"ハーゲンダッツ（ジャポネ味）",image:"Item24",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000025",name:"ごろごろ野菜の豚汁",image:"Item25",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000026",name:"抹茶もなか",image:"Item26",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000027",name:"チロルチョコ",image:"Item27",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000028",name:"焼肉さん太郎",image:"Item28",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":8, "2015/6":10,"2015/5":5,"2015/4":6,"2015/3":7,"2015/2":8], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000029",name:"サラダチキン",image:"Item29",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000030",name:"セブンカフェドーナツ",image:"Item30",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000031",name:"クリアアサヒ",image:"Item31",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[1:1,4:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000032",name:"ポッキー",image:"Item32",award1:[],award2:[], prchedHist:["2015/8":2, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000033",name:"ふんわりやわらかティシュー",image:"Item33",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000034",name:"鶏ぞうすい",image:"Item34",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000035",name:"ドライカレー",image:"Item35",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000036",name:"とろけるクリームプリン",image:"Item36",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000037",name:"ポテトチップス（のり塩味）",image:"Item37",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000038",name:"アポロ",image:"Item38",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000039",name:"サッポロ一番（しょうゆ味）",image:"Item39",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000040",name:"おにぎり（おかかづくし味）",image:"Item40",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        
        items.append(Item(itemid:"000041",name:"C.C.レモン",image:"Item41",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":6,"2015/5":7,"2015/4":8,"2015/3":7,"2015/2":7], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000042",name:"チョコチップクッキー",image:"Item42",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000043",name:"コカ・コーラゼロ",image:"Item43",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000044",name:"レッドブル",image:"Item44",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000045",name:"BOSS",image:"Item45",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000046",name:"ワンダモーニングショット",image:"Item46",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000047",name:"フリスク",image:"Item47",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000048",name:"三ツ矢サイダー",image:"Item48",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000049",name:"ピノ",image:"Item49",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000050",name:"ミルキー",image:"Item50",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000051",name:"淡麗グリーンラベル",image:"Item51",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000052",name:"クリスタルゲイザー",image:"Item52",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000053",name:"ポカリスエット",image:"Item53",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000054",name:"綾鷹",image:"Item54",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000055",name:"クリニカ",image:"Item55",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000056",name:"バカルディ",image:"Item56",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000057",name:"特茶",image:"Item57",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000058",name:"ピスタチオ",image:"Item58",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000059",name:"カップヌードル",image:"Item59",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000060",name:"U.F.O.",image:"Item60",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000061",name:"ヱビスビール",image:"Item61",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000062",name:"恵方巻き",image:"Item62",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000063",name:"水に流せるポケットティシュー",image:"Item63",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000064",name:"みかん",image:"Item64",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000065",name:"雪見だいふく",image:"Item65",award1:[],award2:[], prchedHist:["2015/8":0, "2015/7":3, "2015/6":3,"2015/5":5,"2015/4":2,"2015/3":3,"2015/2":4], prchedThisM:[0:0], brandImage: "Brand2_icon", outline:"説明１"))
    }
    
    //商品の表示順を決定
    func createShowOrder() {
        showOrder = [
             1, 2, 3, 5, 6, 8, 4, 9,10,12,11,13,15, 7,14,16,18,20,19,17,
            22,21,23,24,25,26,27,28,30,29,31,32,37,33,36,35,34,38,40,39,
            41,42,43,45,46,44,47,48,49,50,51,52,53,54,55,56,57,58,59,60,
            61,62,63,64,65
        ]
    }
    
    //認定ハードコーディング
    func createAwards() {
        awards.append(Award(awardid:0,level:1,name:"認定0",image:"gold_medal_03",title:"購入数100個突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n倉澤様はこれまでで累計100個の「コカ・コーラ」をご購入されましたので、\n感謝の印として記念メダルを進呈いたします。\n皆様のご期待に沿えるよう、これからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"コカ・コーラジャパン ブランド事業部",num:100))
        awards.append(Award(awardid:1,level:2,name:"認定1",image:"silver_medal_03",title:"50個購入達成の感謝を込めて",body:"いつもご愛好頂き誠にありがとうございます。\n「コカ・コーラ」を累計50個ご購入頂いた倉澤様に感謝の印として、\n弊社から特別認定メダルを贈呈致します。\nこれからも変わらぬご愛好のほどよろしくお願いします。",from:"コカ・コーラジャパン ブランド事業部",num:50))
        awards.append(Award(awardid:2,level:3,name:"認定2",image:"bronze_medal_03",title:"30個達成おめでとうございます！",body:"いつもご購入ありがとうございます。\n「コカ・コーラ」の累計購入数が30個を超えました！\n倉澤様への特別の感謝を込めて認定バッジを贈呈致します。\n今後ともよろしくお願いします。",from:"コカ・コーラジャパン ブランド事業部",num:30))
        awards.append(Award(awardid:3,level:1,name:"認定3",image:"gold_trophy_03",title:"連続購入30日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n30日間連続でご購入頂いた「コカ・コーラ」をご愛好の倉澤様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"コカ・コーラジャパン ブランド事業部",num:30))
        awards.append(Award(awardid:4,level:2,name:"認定4",image:"silver_trophy_03",title:"連続購入20日達成！！",body:"いつもご愛顧を賜りまして厚く御礼申し上げます。\n弊社が情熱を込めて開発した「コカ・コーラ」を20日間も連続でご購入頂き、\n大変嬉しく思っております。\n今後とも、どうぞよろしくお願い申し上げます。",from:"コカ・コーラジャパン ブランド事業部",num:20))
        awards.append(Award(awardid:5,level:3,name:"認定5",image:"bronze_trophy_03",title:"連続購入10日達成！",body:"いつもご購入ありがとうございます。\n倉澤様の「コカ・コーラ」連続購入日数が10日を超えましたので、\n感謝の証として記念メダルを進呈致します。\n商品についてご要望等ございましたらご連絡下さい。\n今後とも、どうぞよろしくお願い申し上げます。",from:"コカ・コーラジャパン ブランド事業部",num:10))
        awards.append(Award(awardid:6,level:2,name:"認定6",image:"silver_medal_03",title:"Thanks Taka!",body:"いつも買ってくれてありがとう。\nTakaは本当に「紀州南高梅おにぎり」が好きなんだね！\nTakaは気づいてないかもしれないけど、なんと連続購入日数が30日を超えました！\nこれからもTakaに満足してもらえるおにぎりを作り続けるから引き続き応援よろしく！",from:"セブン-イレブン 商品開発部",num:30))
        awards.append(Award(awardid:7,level:3,name:"認定7",image:"bronze_medal_03",title:"やったねTaka!連続10日間達成！！",body:"毎度ありがとうございます。\nTaka様の「紀州南高梅おにぎり」に対する特別のご愛好の結果、連続購入日数が10日を超えました！\n感謝の印として記念メダルを進呈致します。\n商品についてご要望等ございましたらご連絡下さい。\n今後とも、どうぞよろしくお願い申し上げます。",from:"セブン-イレブン 商品開発部",num:10))
        awards.append(Award(awardid:8,level:3,name:"認定8",image:"bronze_trophy_03",title:"連続購入30日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n30日間連続でご購入頂いた「お～いお茶」をご愛好の倉澤様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"伊藤園　販促部",num:30))
        awards.append(Award(awardid:9,level:3,name:"認定9",image:"bronze_medal_03",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:30))
        awards.append(Award(awardid:10,level:3,name:"認定10",image:"bronze_trophy_03",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:30))
        awards.append(Award(awardid:11,level:3,name:"認定11",image:"bronze_medal_03",title:"30個達成おめでとうございます！",body:"いつもご購入ありがとうございます。\n「KitKat」の累計購入数が30個を超えました！\n倉澤様への特別の感謝を込めて認定バッジを贈呈致します。\n今後ともよろしくお願いします。",from:"ネスレ 商品開発部",num:30))
        awards.append(Award(awardid:12,level:3,name:"認定12",image:"bronze_trophy_03",title:"連続購入10日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n10日間連続でご購入頂いた「森永の焼プリン」をご愛好の倉澤様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"ネスレ 商品開発部",num:10))
        awards.append(Award(awardid:13,level:2,name:"認定13",image:"silver_trophy_03",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:14,level:3,name:"認定14",image:"bronze_trophy_03",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:15,level:1,name:"認定3",image:"bronze_trophy_03",title:"連続購入10日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n10日間連続でご購入頂いた「森永の焼プリン」をご愛好の倉澤様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"森永乳業 ブランド事業部",num:10))
        awards.append(Award(awardid:16,level:3,name:"認定7",image:"bronze_medal_03",title:"やったねTaka!連続10日間達成！！",body:"毎度ありがとうございます。\nTaka様の「紀州南高梅おにぎり」に対する特別のご愛好の結果、連続購入日数が10日を超えました！\n感謝の印として記念メダルを進呈致します。\n商品についてご要望等ございましたらご連絡下さい。\n今後とも、どうぞよろしくお願い申し上げます。",from:"セブン-イレブン 商品開発部",num:10))
        awards.append(Award(awardid:17,level:3,name:"認定15",image:"bronze_medal_03",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:10))
        
        
        awards.append(Award(awardid:18,level:1,name:"認定18",image:"gold_medal_03",title:"購入数100個突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n倉澤様はこれまでで累計100個の「セブンカフェ」をご購入されましたので、\n感謝の印として記念メダルを進呈いたします。\n皆様のご期待に沿えるよう、これからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"セブン-イレブン 商品開発部",num:100))
        awards.append(Award(awardid:19,level:2,name:"認定19",image:"silver_medal_03",title:"50個購入達成の感謝を込めて",body:"いつもご愛好頂き誠にありがとうございます。\n「セブンカフェ」を累計50個ご購入頂いた倉澤様に感謝の印として、\n弊社から特別認定メダルを贈呈致します。\nこれからも変わらぬご愛好のほどよろしくお願いします。",from:"セブン-イレブン 商品開発部",num:50))
        awards.append(Award(awardid:20,level:3,name:"認定20",image:"bronze_medal_03",title:"30個達成おめでとうございます！",body:"いつもご購入ありがとうございます。\n「セブンカフェ」の累計購入数が30個を超えました！\n倉澤様への特別の感謝を込めて認定バッジを贈呈致します。\n今後ともよろしくお願いします。",from:"セブン-イレブン 商品開発部",num:30))
        awards.append(Award(awardid:21,level:1,name:"認定21",image:"bronze_trophy_03",title:"連続購入30日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n30日間連続でご購入頂いた「セブンカフェ」をご愛好の倉澤様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"セブン-イレブン 商品開発部",num:30))

        
    }
    
    //UIntに16進で数値をいれるとUIColorが戻る関数
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}