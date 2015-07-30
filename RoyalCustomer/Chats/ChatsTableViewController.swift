//
//  ChatsTableViewController.swift
//  RoyalCustomer
//
//  Created by NRI on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class ChatsTableViewController: UITableViewController {
    
    var chats: [Chat] { return account.chats }

    convenience init() {
        self.init(style: .Plain)
        title = "Chats"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "composeAction")
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem() // TODO: KVO
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = chatTableViewCellHeight
        tableView.separatorInset.left = chatTableViewCellInsetLeft
        tableView.registerClass(ChatTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ChatTableViewCell))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(ChatTableViewCell), forIndexPath: indexPath) as! ChatTableViewCell
        cell.configureWithChat(account.chats[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            account.chats.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            if account.chats.count == 0 {
                navigationItem.leftBarButtonItem = nil  // TODO: KVO
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let chat = chats[indexPath.row]
        let chatViewController = ChatViewController(chat: chat)
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    func composeAction() {
        let navigationController = UINavigationController(rootViewController: ComposeViewController())
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    //    //ナビゲーション生成
    //    init() {
    //        super.init(nibName: nil, bundle: nil)
    //        // Viewの背景色をWhiteに設定する.
    //        self.view.backgroundColor = UIColor.whiteColor()
    //        //tabBarItemのアイコンをContactsに、タグを1と定義する.
    //        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 1)
    //    }
    //
    //    //ナビゲーション生成
    //    required init(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //    }
    //
    //    //ナビゲーション生成
    //    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
    //        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    //    }
    
    
    
}
