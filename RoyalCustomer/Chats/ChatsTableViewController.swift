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
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate


    convenience init() {
        self.init(style: .Plain)
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        title.textColor = primaryBackgroundColor
        title.text = "メッセージ"
        title.font = UIFont(name: fontName, size: 20)
        title.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = title
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "composeAction")
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 1)
        
        
        // バックボタンを変更
        var backButton :UIBarButtonItem = UIBarButtonItem()
        backButton.title = "戻る";
        self.navigationItem.backBarButtonItem = backButton;
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        navigationItem.leftBarButtonItem = editButtonItem() // TODO: KVO
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
    
}

