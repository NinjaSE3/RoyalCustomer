//
//  AppDelegate.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

let account = Account()
var items  :[Item] = []
var awards :[Award] = []
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
        secondaryBackgroundColor = UIColorFromRGB(0xB6B6B6);

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
        let chatsTableViewController: UIViewController = ChatsTableViewController()
        // UINavigationを設定
        let itemListNavigationController = UINavigationController(rootViewController: itemListViewController)
        let chatsNavigationController = UINavigationController(rootViewController: chatsTableViewController)
        
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
            Chat(user: User(ID: 1, username: "CocaCola", firstName: "Coca", lastName: "Cola"), lastMessageText: "Thatnks for checking out Chats! :-)", lastMessageSentDate: NSDate()),
            Chat(user: User(ID: 2, username: "SevenEleven", firstName: "Seven", lastName: "Eleven"), lastMessageText: "6 sounds good :-)", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute)),
            Chat(user: User(ID: 3, username: "walterstephanie", firstName: "Valentine", lastName: "Sanchez"), lastMessageText: "Haha", lastMessageSentDate: NSDate(timeIntervalSinceNow: -minute*12)),
            Chat(user: User(ID: 23, username: "benlu", firstName: "Ben", lastName: "Lu"), lastMessageText: "I have no profile picture.", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*5)),
            Chat(user: User(ID: 4, username: "wake_gs", firstName: "Aghbalu", lastName: "Amghar"), lastMessageText: "Damn", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*13)),
            Chat(user: User(ID: 22, username: "doitlive", firstName: "中文 日本語", lastName: "한국인"), lastMessageText: "I have no profile picture or extended ASCII initials.", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*24)),
            Chat(user: User(ID: 5, username: "kfriedson", firstName: "Candice", lastName: "Meunier"), lastMessageText: "I can't wait to see you! ❤️", lastMessageSentDate: NSDate(timeIntervalSinceNow: -hour*34)),
            Chat(user: User(ID: 6, username: "mmorits", firstName: "Ferdynand", lastName: "Kaźmierczak"), lastMessageText: "http://youtu.be/UZb2NOHPA2A", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*2-1)),
            Chat(user: User(ID: 7, username: "krystalfister", firstName: "Lauren", lastName: "Cooper"), lastMessageText: "Thinking of you...", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*3)),
            Chat(user: User(ID: 8, username: "christianramsey", firstName: "Bradley", lastName: "Simpson"), lastMessageText: "👍", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*4)),
            Chat(user: User(ID: 9, username: "curiousonaut", firstName: "Clotilde", lastName: "Thomas"), lastMessageText: "Sounds good!", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*5)),
            Chat(user: User(ID: 10, username: "acoops_", firstName: "Tania", lastName: "Caramitru"), lastMessageText: "Cool. Thanks!", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*6)),
            Chat(user: User(ID: 11, username: "tpatteri", firstName: "Ileana", lastName: "Mazilu"), lastMessageText: "Hey, what are you up to?", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*7)),
            Chat(user: User(ID: 12, username: "giuliusa", firstName: "Asja", lastName: "Zuhrić"), lastMessageText: "Drinks tonight?", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*8)),
            Chat(user: User(ID: 13, username: "liang", firstName: "Sarah", lastName: "Lam"), lastMessageText: "Are you going to Blues on the Green tonight?", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*9)),
            Chat(user: User(ID: 14, username: "dhoot_amit", firstName: "Ishan", lastName: "Sarin"), lastMessageText: "Thanks for open sourcing Chats.", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*10)),
            Chat(user: User(ID: 15, username: "leezlee", firstName: "Stella", lastName: "Vosper"), lastMessageText: "Those who dance are considered insane by those who can't hear the music.", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 16, username: "elenadissi", firstName: "Georgeta", lastName: "Mihăileanu"), lastMessageText: "Hey, what are you up to?", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 17, username: "juanadearte", firstName: "Alice", lastName: "Adams"), lastMessageText: "Hey, want to hang out tonight?", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 18, username: "teleject", firstName: "Gerard", lastName: "Gómez"), lastMessageText: "Haha. Hell yeah! No problem, bro!", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 19, username: "oksanafrewer", firstName: "Melinda", lastName: "Osváth"), lastMessageText: "I am excellent!!! I was thinking recently that you are a very inspirational person.", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 20, username: "cynthiasavard", firstName: "Saanvi", lastName: "Sarin"), lastMessageText: "See you soon!", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11)),
            Chat(user: User(ID: 21, username: "stushona", firstName: "Jade", lastName: "Roger"), lastMessageText: "😊", lastMessageSentDate: NSDate(timeIntervalSinceNow: -day*11))
        ]
        for chat in account.chats {
            account.users.append(chat.user)
        }
        account.phone = "2102390602"
        account.user = User(ID: 24, username: "guest", firstName: "Guest", lastName: "User")
        account.accessToken = "guest_access_token"
    }
    
    //商品ハードコーディング
    func createItems() {
        items.append(Item(itemid:"000001",name:"商品1",image:"Item1",award1:[0,1,2],award2:[3,4,5]))
        items.append(Item(itemid:"000002",name:"商品2",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000003",name:"商品3",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000004",name:"商品4",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000005",name:"商品5",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000006",name:"商品6",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000007",name:"商品7",image:"Item1",award1:[6,7],award2:[]))
        items.append(Item(itemid:"000008",name:"商品8",image:"Item1",award1:[15],award2:[]))
        items.append(Item(itemid:"000009",name:"商品9",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000010",name:"商品10",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000011",name:"商品11",image:"Item1",award1:[],award2:[8]))
        items.append(Item(itemid:"000012",name:"商品12",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000013",name:"商品13",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000014",name:"商品14",image:"Item1",award1:[9],award2:[10]))
        items.append(Item(itemid:"000015",name:"商品15",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000016",name:"商品16",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000017",name:"商品17",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000018",name:"商品18",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000019",name:"商品19",image:"Item1",award1:[11],award2:[12]))
        items.append(Item(itemid:"000020",name:"商品20",image:"Item1",award1:[],award2:[13,14]))
        items.append(Item(itemid:"000021",name:"商品21",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000022",name:"商品22",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000023",name:"商品23",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000024",name:"商品24",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000025",name:"商品25",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000026",name:"商品26",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000027",name:"商品27",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000028",name:"商品28",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000029",name:"商品29",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000030",name:"商品30",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000031",name:"商品31",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000032",name:"商品32",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000033",name:"商品33",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000034",name:"商品34",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000035",name:"商品35",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000036",name:"商品36",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000037",name:"商品37",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000038",name:"商品38",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000039",name:"商品39",image:"Item1",award1:[],award2:[]))
        items.append(Item(itemid:"000040",name:"商品40",image:"Item1",award1:[],award2:[]))
        
    }
    
    //認定ハードコーディング
    func createAwards() {
        awards.append(Award(awardid:0,level:1,name:"認定0",image:"Award1_1_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:1,level:2,name:"認定1",image:"Award1_2_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:2,level:3,name:"認定2",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:3,level:1,name:"認定3",image:"Award2_1_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:4,level:2,name:"認定4",image:"Award2_2_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:5,level:3,name:"認定5",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:6,level:2,name:"認定6",image:"Award1_2_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:7,level:3,name:"認定7",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:8,level:3,name:"認定8",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:9,level:3,name:"認定9",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:10,level:3,name:"認定10",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:11,level:3,name:"認定11",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:12,level:3,name:"認定12",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:13,level:2,name:"認定13",image:"Award2_2_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:14,level:3,name:"認定14",image:"Award2_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
        awards.append(Award(awardid:15,level:3,name:"認定15",image:"Award1_3_icon",title:"認定タイトル",body:"認定文章",from:"認定ブランド"))
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