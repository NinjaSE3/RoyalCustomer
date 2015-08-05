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
        primaryColor = UIColorFromRGB(0x03A9F4);
        secondaryColor = UIColorFromRGB(0xB3E5FC);
        primaryBackgroundColor = UIColorFromRGB(0xF8F8F8);
        secondaryBackgroundColor = UIColorFromRGB(0xE6E6E6);
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
        itemListViewController.tabBarItem = UITabBarItem(title: "購入商品一覧", image: UIImage(named: "UserIcon_grey"), selectedImage: UIImage(named: "UserIcon"))
        let chatsTableViewController: UIViewController = ChatsTableViewController()
        chatsTableViewController.tabBarItem = UITabBarItem(title: "メッセージ一覧", image: UIImage(named: "ChatIcon_grey"), selectedImage: UIImage(named: "ChatIcon"))
        // UINavigationを設定
        let itemListNavigationController = UINavigationController(rootViewController: itemListViewController)
        itemListNavigationController.navigationBar.barTintColor = primaryColor
        itemListNavigationController.navigationBar.tintColor = primaryBackgroundColor
        //var image:UIImage = UIImage(named: "Rainbow")!
        //image.drawInRect(CGRectMake(0, 0, 44, 80))
        //itemListNavigationController.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        let chatsNavigationController = UINavigationController(rootViewController: chatsTableViewController)
        chatsNavigationController.navigationBar.barTintColor = primaryColor
        chatsNavigationController.navigationBar.tintColor = primaryBackgroundColor

        
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
            Chat(user: User(ID: 1, username: "森永の焼プリン", firstName: "森永の焼プリン", lastName: "＠太一郎"), lastMessageText: "おいしいをデザインする", lastMessageSentDate: NSDate()),
            Chat(user: User(ID: 8, username: "カリカリ梅おむすび", firstName: "カリカリ梅おむすび", lastName: "＠鈴木"), lastMessageText: "混ぜ飯おむすび", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute)),
            Chat(user: User(ID: 3, username: "週刊少年ジャンプ", firstName: "週刊少年ジャンプ", lastName: "＠退席中"), lastMessageText: "友情・努力・勝利", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute*12)),
            Chat(user: User(ID: 10, username: "ガツン、とみかん", firstName: "ガツン、とみかん", lastName: "＠退席中"), lastMessageText: "夏はこっちだ！", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*5)),
            Chat(user: User(ID: 4, username: "カリカリダブルチーズ", firstName: "カリカリダブルチーズ", lastName: "＠林田"), lastMessageText: "カリカリとした食感のツイスト（ねじれた）形状のコーンスナックです。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*13)),
            Chat(user: User(ID: 18, username: "かっぱえびせん", firstName: "かっぱえびせん", lastName: "＠退席中"), lastMessageText: "やめられないとまらない", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*34)),
            Chat(user: User(ID: 11, username: "お〜いお茶", firstName: "お〜いお茶", lastName: "＠退席中"), lastMessageText: "史上最高のお〜いお茶 できました。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*2-1)),
            Chat(user: User(ID: 6, username: "セブンカフェ", firstName: "セブンカフェ", lastName: "＠退席中"), lastMessageText: "一杯ずつ、挽きたて、淹れたて", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*3)),
            Chat(user: User(ID: 7, username: "手巻おにぎり紀州南高梅（たたき梅）", firstName: "手巻おにぎり紀州南高梅（たたき梅）", lastName: "＠退席中"), lastMessageText: "海苔のうまさ広がる", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*4)),
            Chat(user: User(ID: 2, username: "ムービングラバーワイルドシェイク", firstName: "ムービングラバーワイルドシェイク", lastName: "＠退席中"), lastMessageText: "あふれる毛束感、へたらず長持ち", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*5)),
            Chat(user: User(ID: 19, username: "キットカット", firstName: "キットカット", lastName: "＠アンリ・ネスレ"), lastMessageText: "ブレイクタイム", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*6)),
            Chat(user: User(ID: 13, username: "カントリーマアム", firstName: "カントリーマアム", lastName: "＠退席中"), lastMessageText: "ホームメイドのおいしさ。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*7)),
            Chat(user: User(ID: 9, username: "ロースカツカレー", firstName: "ロースカツカレー", lastName: "＠退席中"), lastMessageText: "食べ応えのあるジューシーなロースカツを盛り付けたカレーです。", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*8))
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
        items.append(Item(itemid:"000001",name:"森永の焼プリン",image:"Item1",award1:[0,1,2],award2:[3,4,5], prchedHist:["2015/8":3,"2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,3:2], brandImage: "Brand1_icon", outline:"カラメルソースのほろ苦さがクリーミープリンにぴったりです。\n遠赤外線オーブンで焼き上げたシンプルな味わいを、\nゆったりとリラックスしてお楽しみ下さい。"))
        items.append(Item(itemid:"000002",name:"ムービングラバーワイルドシェイク",image:"Item2",award1:[],award2:[], prchedHist:["2015/8":3,"2015/7":20, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand3_icon", outline:"説明１"))
        items.append(Item(itemid:"000003",name:"週刊少年ジャンプ",image:"Item3",award1:[],award2:[], prchedHist:["2015/8":3,"2015/7":22, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand4_icon", outline:"説明１"))
        items.append(Item(itemid:"000004",name:"カリカリダブルチーズ",image:"Item4",award1:[],award2:[], prchedHist:["2015/7":3, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000005",name:"バナナ",image:"Item5",award1:[],award2:[], prchedHist:["2015/7":12, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000006",name:"セブンカフェ",image:"Item6",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000007",name:"手巻おにぎり紀州南高梅（たたき梅）",image:"Item7",award1:[6,7],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000008",name:"カリカリ梅おむすび",image:"Item8",award1:[15],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000009",name:"ロースカツカレー",image:"Item9",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand2_icon", outline:"説明１"))
        items.append(Item(itemid:"000010",name:"ガツン、とみかん",image:"Item10",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000011",name:"お〜いお茶",image:"Item11",award1:[],award2:[8], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand5_icon", outline:"説明１"))
        items.append(Item(itemid:"000012",name:"盛り合わせフルーツ",image:"Item12",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000013",name:"カントリーマアム",image:"Item13",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000014",name:"力水",image:"Item14",award1:[9],award2:[10], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand6_icon", outline:"説明１"))
        items.append(Item(itemid:"000015",name:"ちょっと贅沢ミックスゼリー",image:"Item15",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000016",name:"カロリーメイト",image:"Item16",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000017",name:"コカ・コーラ",image:"Item17",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000018",name:"かっぱえびせん",image:"Item18",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000019",name:"キットカット",image:"Item19",award1:[11],award2:[12], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand8_icon", outline:"説明１"))
        items.append(Item(itemid:"000020",name:"パピコ（ホワイトサワー味）",image:"Item20",award1:[],award2:[13,14], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand7_icon", outline:"説明１"))
        items.append(Item(itemid:"000021",name:"口どけなめらか濃厚フロマージュ",image:"Item21",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000022",name:"じゃがりこ（抹茶クリーム味）",image:"Item22",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000023",name:"おでん",image:"Item23",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000024",name:"ハーゲンダッツ（ジャポネ味）",image:"Item24",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000025",name:"ごろごろ野菜の豚汁",image:"Item25",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000026",name:"抹茶もなか",image:"Item26",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000027",name:"チロルチョコ",image:"Item27",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000028",name:"焼肉さん太郎",image:"Item28",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000029",name:"サラダチキン",image:"Item29",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000030",name:"クリアアサヒ",image:"Item30",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000031",name:"セブンカフェドーナツ",image:"Item31",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000032",name:"商品32",image:"Item12",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000033",name:"商品33",image:"Item13",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000034",name:"商品34",image:"Item14",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000035",name:"商品35",image:"Item15",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000036",name:"商品36",image:"Item16",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000037",name:"商品37",image:"Item17",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000038",name:"商品38",image:"Item18",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000039",name:"商品39",image:"Item19",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000040",name:"商品40",image:"Item20",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        
        items.append(Item(itemid:"000041",name:"商品41",image:"Item1",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000042",name:"商品42",image:"Item2",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000043",name:"商品43",image:"Item3",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000044",name:"商品44",image:"Item4",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000045",name:"商品45",image:"Item5",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000046",name:"商品46",image:"Item6",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000047",name:"商品47",image:"Item7",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000048",name:"商品48",image:"Item8",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000049",name:"商品49",image:"Item9",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000050",name:"商品50",image:"Item10",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000051",name:"商品51",image:"Item11",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000052",name:"商品52",image:"Item12",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000053",name:"商品53",image:"Item13",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000054",name:"商品54",image:"Item14",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000055",name:"商品55",image:"Item15",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000056",name:"商品56",image:"Item16",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000057",name:"商品57",image:"Item17",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000058",name:"商品58",image:"Item18",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000059",name:"商品59",image:"Item19",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000060",name:"商品60",image:"Item20",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000061",name:"商品61",image:"Item1",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000062",name:"商品62",image:"Item2",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000063",name:"商品63",image:"Item3",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000064",name:"商品64",image:"Item4",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
        items.append(Item(itemid:"000065",name:"商品65",image:"Item5",award1:[],award2:[], prchedHist:["2015/7":13, "2015/6":10,"2015/5":12,"2015/4":5,"2015/3":8,"2015/2":15], prchedThisM:[1:1,4:1,6:1,7:2,8:1,9:1,10:1,11:1,12:1,13:1,14:1,20:1], brandImage: "Brand1_icon", outline:"説明１"))
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
        awards.append(Award(awardid:0,level:1,name:"認定0",image:"Award1_1_icon",title:"購入数100個突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n林田様はこれまでで累計100個の「森永の焼きプリン」をご購入されましたので、\n感謝の印として記念メダルを進呈いたします。\n皆様のご期待に沿えるよう、これからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"森永製菓 ブランド事業部",num:100))
        awards.append(Award(awardid:1,level:2,name:"認定1",image:"Award1_2_icon",title:"50個購入達成の感謝を込めて",body:"いつもご愛好頂き誠にありがとうございます。\n「森永の焼きプリン」を累計50個ご購入頂いた林田様に感謝の印として、\n弊社から特別認定メダルを贈呈致します。\nこれからも変わらぬご愛好のほどよろしくお願いします。",from:"森永製菓 ブランド事業部",num:50))
        awards.append(Award(awardid:2,level:3,name:"認定2",image:"Award1_3_icon",title:"30個達成おめでとうございます！",body:"いつもご購入ありがとうございます。\n「森永の焼きプリン」の累計購入数が30個を超えました！\n林田様への特別の感謝を込めて認定バッジを贈呈致します。\n今後ともよろしくお願いします。",from:"森永製菓 ブランド事業部",num:30))
        awards.append(Award(awardid:3,level:1,name:"認定3",image:"Award2_1_icon",title:"連続購入30日突破記念メダル",body:"いつもご愛好頂き誠にありがとうございます。\n30日間連続でご購入頂いた「森永の焼きプリン」をご愛好の林田様へ\n素敵なプレゼントをご用意しました。\n皆様のご期待に沿えるようこれからも邁進してまいりますので、\nこれからも変わらぬご愛好を賜りますようお願い申し上げます。",from:"森永製菓 ブランド事業部",num:30))
        awards.append(Award(awardid:4,level:2,name:"認定4",image:"Award2_2_icon",title:"連続購入20日達成！！",body:"いつもご愛顧を賜りまして厚く御礼申し上げます。\n弊社が情熱を込めて開発した「森永の焼きプリン」を20日間も連続でご購入頂き、\n大変嬉しく思っております。\n今後とも、どうぞよろしくお願い申し上げます。",from:"森永製菓 ブランド事業部",num:20))
        awards.append(Award(awardid:5,level:3,name:"認定5",image:"Award2_3_icon",title:"連続購入10日達成！",body:"いつもご購入ありがとうございます。\n林田様の「森永の焼きプリン」連続購入日数が10日を超えましたので、\n感謝の証として記念メダルを進呈致します。\n商品についてご要望等ございましたらご連絡下さい。\n今後とも、どうぞよろしくお願い申し上げます。",from:"森永製菓 ブランド事業部",num:10))
        awards.append(Award(awardid:6,level:2,name:"認定6",image:"Award1_2_icon",title:"Thanks Ash!",body:"いつも買ってくれてありがとう。\nAshは本当に「紀州南高梅おにぎり」が好きなんだね！\nAshは気づいてないかもしれないけど、なんと連続購入日数が30日を超えました！\nこれからもAshに満足してもらえるおにぎりを作り続けるから引き続き応援よろしく！",from:"セブン-イレブン 商品開発部",num:30))
        awards.append(Award(awardid:7,level:3,name:"認定7",image:"Award1_3_icon",title:"やったねAsh!連続10日間達成！！",body:"毎度ありがとうございます。\nAsh様の「紀州南高梅おにぎり」に対する特別のご愛好の結果、連続購入日数が10日を超えました！\n感謝の印として記念メダルを進呈致します。\n商品についてご要望等ございましたらご連絡下さい。\n今後とも、どうぞよろしくお願い申し上げます。",from:"セブン-イレブン 商品開発部",num:10))
        awards.append(Award(awardid:8,level:3,name:"認定8",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:9,level:3,name:"認定9",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:10,level:3,name:"認定10",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:11,level:3,name:"認定11",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:12,level:3,name:"認定12",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:13,level:2,name:"認定13",image:"Award2_2_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:14,level:3,name:"認定14",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
        awards.append(Award(awardid:15,level:3,name:"認定15",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド",num:100))
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