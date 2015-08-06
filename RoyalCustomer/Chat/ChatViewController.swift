//
//  ChatViewController.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import AudioToolbox
import UIKit

let messageFontSize: CGFloat = 15
let toolBarMinHeight: CGFloat = 44
let textViewMaxHeight: (portrait: CGFloat, landscape: CGFloat) = (portrait: 272, landscape: 90)
let messageSoundOutgoing: SystemSoundID = createMessageSoundOutgoing()


class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    let chat: Chat
    var tableView: UITableView!
    var toolBar: UIToolbar!
    var textView: UITextView!
    var sendButton: UIButton!
    var rotating = false
    
    // socket.io
    let socket = SocketIOClient(socketURL: "http://52.8.45.203:3000")
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override var inputAccessoryView: UIView! {
        get {
            if toolBar == nil {
                toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, toolBarMinHeight-0.5))
                
                textView = InputTextView(frame: CGRectZero)
                textView.backgroundColor = UIColor(white: 250/255, alpha: 1)
                textView.delegate = self
                textView.font = UIFont.systemFontOfSize(messageFontSize)
                textView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha:1).CGColor
                textView.layer.borderWidth = 0.5
                textView.layer.cornerRadius = 5
                //            textView.placeholder = "Message"
                textView.scrollsToTop = false
                textView.textContainerInset = UIEdgeInsetsMake(4, 3, 3, 3)
                toolBar.addSubview(textView)
                
                sendButton = UIButton.buttonWithType(.System) as! UIButton
                sendButton.enabled = false
                sendButton.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
                sendButton.setTitle("Send", forState: .Normal)
                sendButton.setTitleColor(UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1), forState: .Disabled)
                sendButton.setTitleColor(UIColor(red: 1/255, green: 122/255, blue: 255/255, alpha: 1), forState: .Normal)
                sendButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
                sendButton.addTarget(self, action: "sendAction", forControlEvents: UIControlEvents.TouchUpInside)
                toolBar.addSubview(sendButton)
                
                // Auto Layout allows `sendButton` to change width, e.g., for localization.
                textView.setTranslatesAutoresizingMaskIntoConstraints(false)
                sendButton.setTranslatesAutoresizingMaskIntoConstraints(false)
                toolBar.addConstraint(NSLayoutConstraint(item: textView, attribute: .Left, relatedBy: .Equal, toItem: toolBar, attribute: .Left, multiplier: 1, constant: 8))
                toolBar.addConstraint(NSLayoutConstraint(item: textView, attribute: .Top, relatedBy: .Equal, toItem: toolBar, attribute: .Top, multiplier: 1, constant: 7.5))
                toolBar.addConstraint(NSLayoutConstraint(item: textView, attribute: .Right, relatedBy: .Equal, toItem: sendButton, attribute: .Left, multiplier: 1, constant: -2))
                toolBar.addConstraint(NSLayoutConstraint(item: textView, attribute: .Bottom, relatedBy: .Equal, toItem: toolBar, attribute: .Bottom, multiplier: 1, constant: -8))
                toolBar.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .Right, relatedBy: .Equal, toItem: toolBar, attribute: .Right, multiplier: 1, constant: 0))
                toolBar.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .Bottom, relatedBy: .Equal, toItem: toolBar, attribute: .Bottom, multiplier: 1, constant: -4.5))
            }
            return toolBar
        }
    }
    
    init(chat: Chat) {
        self.chat = chat
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
        self.title = chat.user.name
        appDelegate._chat = chat
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        title.textColor = primaryBackgroundColor
        title.text = chat.user.name
        title.font = UIFont(name: fontName, size: 16)
        title.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = title
        
        chat.loadedMessages = []
        
        if(chat.user.username == "コカ・コーラ"){
        //socket.io
        sleep(1)
        self.socket.connect()
        self.socket.onAny {println("Got event: \($0.event), with items: \($0.items)")}

        // socket.io
        self.addHandlers()
        }
        
        //getChatLog
        var chatLog:JSON = self.getChatLog(account.user.username,brandname: chat.user.username)
        
        for(var i=0;i<chatLog.length;i++){
            //チャット相手からの送信
            if(JSON(chatLog[i]["from"]).toString(pretty: true) == chat.user.username){
                chat.loadedMessages.append(
                    [Message(
                        incoming: true,
                        text: JSON(chatLog[i]["chattext"]).toString(pretty: true),
                        sentDate: dateFromISOString(JSON(chatLog[i]["time"]).toString(pretty: true))
                        )
                    ]
                )
            }else{
                chat.loadedMessages.append(
                    [Message(
                        incoming: false,
                        text: JSON(chatLog[i]["chattext"]).toString(pretty: true),
                        sentDate: dateFromISOString(JSON(chatLog[i]["time"]).toString(pretty: true))
                        )
                    ]
                )
            }
        }
	
        let whiteColor = UIColor.whiteColor()
        view.backgroundColor = whiteColor // smooths push animation
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.backgroundColor = whiteColor
        let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: toolBarMinHeight, right: 0)
        tableView.contentInset = edgeInsets
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .Interactive
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .None
        tableView.registerClass(MessageSentDateTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessageSentDateTableViewCell))
        view.addSubview(tableView)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "menuControllerWillHide:", name: UIMenuControllerWillHideMenuNotification, object: nil) // #CopyMessage
        
        tableViewScrollToBottomAnimated(true)
        
        if(chat.user.username == "コカ・コーラ"){
        // socket.io add user
        sleep(1)
        println(chat.user.username)
        self.socket.emit("add user",chat.user.username)
        }

    }
    
    func dateFromISOString(string: String) -> NSDate {
        var dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja")
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        return dateFormatter.dateFromString(string)!
    }
    
    func getChatLog(username:String! ,brandname:String!) -> JSON{
        var getChatLogURL = "http://52.8.45.203/getChatLog?username=" + username.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())! + "&brandname=" + brandname.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let chatLog = JSON(url: getChatLogURL)
        println(getChatLogURL)
        println(chatLog)
        return chatLog
    }
    
    
    // socket.io
    func addHandlers() {
        println("addHandle")

        self.socket.on("add user") {[weak self] data, ack in
            println("add user")
        }
        self.socket.on("add room") {[weak self] data, ack in
            println("add room")
        }
        self.socket.on("new message") {[weak self] data, ack in
            println("new message")
            println(data?[0]["message"] as! String!)
            //socket.ioの返信描画
            self!.receiveAction(data?[0]["message"] as! String!)
        }
        self.socket.on("typing") {[weak self] data, ack in
            println("typing")
        }
        self.socket.on("stop typing") {[weak self] data, ack in
            println("stop typing")
        }
        self.socket.on("disconnect") {[weak self] data, ack in
            println("disconnect")
        }
        self.socket.on("user joined") {[weak self] data, ack in
            println("user joined")
        }
        self.socket.on("user left") {[weak self] data, ack in
            println("user left")
        }
        
        self.socket.onAny {println("Got event: \($0.event), with items: \($0.items)")}
    }
    
    
    func sendAction() {
        // Autocomplete text before sending #hack
        textView.resignFirstResponder()
        textView.becomeFirstResponder()
        
        chat.loadedMessages.append([Message(incoming: false, text: textView.text, sentDate: NSDate())])

        if(chat.user.username == "コカ・コーラ"){
        // socket.io chat message send
        self.socket.emit("new message",textView.text)
        }
        
        //DB insert
        self.addChatLog(account.user.username, brandname: chat.user.username, chattext: textView.text, time: nsDateToString(), read: "0", from: account.user.username)

        textView.text = nil
        updateTextViewHeight()
        sendButton.enabled = false
        
        let lastSection = tableView.numberOfSections()
        tableView.beginUpdates()
        tableView.insertSections(NSIndexSet(index: lastSection), withRowAnimation: .Automatic)
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: 0, inSection: lastSection),
            NSIndexPath(forRow: 1, inSection: lastSection)
            ], withRowAnimation: .Automatic)
        tableView.endUpdates()
        tableViewScrollToBottomAnimated(true)
        AudioServicesPlaySystemSound(messageSoundOutgoing)
    }
    
    //socket.io chatの返信描画
    func receiveAction(message:String){
        // Autocomplete text before sending #hack
//        textView.resignFirstResponder()
//        textView.becomeFirstResponder()
        
        if(chat.user.username == "コカ・コーラ"){
        //socket.io
        chat.loadedMessages.append([Message(incoming: true, text: message, sentDate: NSDate())])
        }
        
        textView.text = nil
        updateTextViewHeight()
        sendButton.enabled = false
        
        let lastSection = tableView.numberOfSections()
        tableView.beginUpdates()
        tableView.insertSections(NSIndexSet(index: lastSection), withRowAnimation: .Automatic)
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: 0, inSection: lastSection),
            NSIndexPath(forRow: 1, inSection: lastSection)
            ], withRowAnimation: .Automatic)
        tableView.endUpdates()
        tableViewScrollToBottomAnimated(true)
        AudioServicesPlaySystemSound(messageSoundOutgoing)
    }
    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidAppear(animated: Bool)  {
        super.viewDidAppear(animated)
        tableView.flashScrollIndicators()
    }
    
    override func viewWillDisappear(animated: Bool)  {
        super.viewWillDisappear(animated)
        chat.draft = textView.text
        println("back")
        
        if(chat.user.username == "コカ・コーラ"){
        // socket.io
        println("disconnect")
        self.socket.emit("disconnect")
//        appDelegate.socket.leaveNamespace()
        self.socket.disconnect(fast: true)
        usleep(10000)
        self.socket.onAny {println("Got event: \($0.event), with items: \($0.items)")}
        }
    }
    
    // This gets called a lot. Perhaps there's a better way to know when `view.window` has been set?
    override func viewDidLayoutSubviews()  {
        super.viewDidLayoutSubviews()
        
        if !chat.draft.isEmpty {
            textView.text = chat.draft
            chat.draft = ""
            textViewDidChange(textView)
            textView.becomeFirstResponder()
        }
    }
    
    //    // #iOS7.1
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        super.willAnimateRotationToInterfaceOrientation(toInterfaceOrientation, duration: duration)
        
        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
            if toolBar.frame.height > textViewMaxHeight.landscape {
                toolBar.frame.size.height = textViewMaxHeight.landscape+8*2-0.5
            }
        } else { // portrait
            updateTextViewHeight()
        }
    }
    //        // #iOS8
    //        override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
    //            super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    //        }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return chat.loadedMessages.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.loadedMessages[section].count + 1 // for sent-date cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(MessageSentDateTableViewCell), forIndexPath: indexPath) as! MessageSentDateTableViewCell
            let message = chat.loadedMessages[indexPath.section][0]
            dateFormatter.dateStyle = .ShortStyle
            dateFormatter.timeStyle = .ShortStyle
            cell.sentDateLabel.text = dateFormatter.stringFromDate(message.sentDate)
            return cell
        } else {
            let cellIdentifier = NSStringFromClass(MessageBubbleTableViewCell)
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MessageBubbleTableViewCell!
            if cell == nil {
                cell = MessageBubbleTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                
                // Add gesture recognizers #CopyMessage
                let action: Selector = "messageShowMenuAction:"
                let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: action)
                doubleTapGestureRecognizer.numberOfTapsRequired = 2
                cell.bubbleImageView.addGestureRecognizer(doubleTapGestureRecognizer)
                cell.bubbleImageView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: action))
            }
            let message = chat.loadedMessages[indexPath.section][indexPath.row-1]
            cell.configureWithMessage(message)
            return cell
        }
    }
    
    // Reserve row selection #CopyMessage
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func textViewDidChange(textView: UITextView) {
        updateTextViewHeight()
        sendButton.enabled = textView.hasText()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo as NSDictionary!
        let frameNew = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let insetNewBottom = tableView.convertRect(frameNew, fromView: nil).height
        let insetOld = tableView.contentInset
        let insetChange = insetNewBottom - insetOld.bottom
        let overflow = tableView.contentSize.height - (tableView.frame.height-insetOld.top-insetOld.bottom)
        
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations: (() -> Void) = {
            if !(self.tableView.tracking || self.tableView.decelerating) {
                // Move content with keyboard
                if overflow > 0 {                   // scrollable before
                    self.tableView.contentOffset.y += insetChange
                    if self.tableView.contentOffset.y < -insetOld.top {
                        self.tableView.contentOffset.y = -insetOld.top
                    }
                } else if insetChange > -overflow { // scrollable after
                    self.tableView.contentOffset.y += insetChange + overflow
                }
            }
        }
        if duration > 0 {
            let options = UIViewAnimationOptions(UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16)) // http://stackoverflow.com/a/18873820/242933
            UIView.animateWithDuration(duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    func keyboardDidShow(notification: NSNotification) {
        let userInfo = notification.userInfo as NSDictionary!
        let frameNew = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let insetNewBottom = tableView.convertRect(frameNew, fromView: nil).height
        
        // Inset `tableView` with keyboard
        let contentOffsetY = tableView.contentOffset.y
        tableView.contentInset.bottom = insetNewBottom
        tableView.scrollIndicatorInsets.bottom = insetNewBottom
        // Prevents jump after keyboard dismissal
        if self.tableView.tracking || self.tableView.decelerating {
            tableView.contentOffset.y = contentOffsetY
        }
    }
    
    func updateTextViewHeight() {
        let oldHeight = textView.frame.height
        let maxHeight = UIInterfaceOrientationIsPortrait(interfaceOrientation) ? textViewMaxHeight.portrait : textViewMaxHeight.landscape
        var newHeight = min(textView.sizeThatFits(CGSize(width: textView.frame.width, height: CGFloat.max)).height, maxHeight)
        #if arch(x86_64) || arch(arm64)
            newHeight = ceil(newHeight)
            #else
            newHeight = CGFloat(ceilf(newHeight.native))
        #endif
        if newHeight != oldHeight {
            toolBar.frame.size.height = newHeight+8*2-0.5
        }
    }
    
    
    
    func nsDateToString() -> String{
        let now = NSDate() // => Feb 13, 2015, 4:05 PM"
        let iso8601Formatter = NSDateFormatter()
        iso8601Formatter.dateFormat = "yyyyMMddHHmmss"
        return iso8601Formatter.stringFromDate(now) // => 20150731212231
    }
    
    func addChatLog(username:String,brandname:String,chattext:String,time:String,read:String,from:String) -> JSON{
        var addChatLogURL = "http://52.8.45.203/addChatLog?username=" + username.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())! + "&brandname=" + brandname.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())! + "&chattext=" + chattext.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())! + "&time=" + time + "&read=" + read + "&from=" + username.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let addChatLogExt = JSON(url: addChatLogURL)
        println(addChatLogURL)
        println(addChatLogExt)
        return addChatLogExt
    }
    
    func tableViewScrollToBottomAnimated(animated: Bool) {
        let numberOfRows = tableView.numberOfRowsInSection(0)
        if numberOfRows > 0 {
            //末尾までスクロールする
            let nos = tableView.numberOfSections()
            let nor = tableView.numberOfRowsInSection(nos-1)
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: nor-1, inSection: nos-1), atScrollPosition: .Bottom, animated: animated)
//            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: numberOfRows-1, inSection: 0), atScrollPosition: .Bottom, animated: animated)
        }
    }
    
    // Handle actions #CopyMessage
    // 1. Select row and show "Copy" menu
    func messageShowMenuAction(gestureRecognizer: UITapGestureRecognizer) {
        let twoTaps = (gestureRecognizer.numberOfTapsRequired == 2)
        let doubleTap = (twoTaps && gestureRecognizer.state == .Ended)
        let longPress = (!twoTaps && gestureRecognizer.state == .Began)
        if doubleTap || longPress {
            let pressedIndexPath = tableView.indexPathForRowAtPoint(gestureRecognizer.locationInView(tableView))!
            tableView.selectRowAtIndexPath(pressedIndexPath, animated: false, scrollPosition: .None)
            
            let menuController = UIMenuController.sharedMenuController()
            let bubbleImageView = gestureRecognizer.view!
            menuController.setTargetRect(bubbleImageView.frame, inView: bubbleImageView.superview!)
            menuController.menuItems = [UIMenuItem(title: "Copy", action: "messageCopyTextAction:")]
            menuController.setMenuVisible(true, animated: true)
        }
    }
    // 2. Copy text to pasteboard
    func messageCopyTextAction(menuController: UIMenuController) {
        let selectedIndexPath = tableView.indexPathForSelectedRow()
        let selectedMessage = chat.loadedMessages[selectedIndexPath!.section][selectedIndexPath!.row-1]
        UIPasteboard.generalPasteboard().string = selectedMessage.text
    }
    // 3. Deselect row
    func menuControllerWillHide(notification: NSNotification) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow() {
            tableView.deselectRowAtIndexPath(selectedIndexPath, animated: false)
        }
        (notification.object as! UIMenuController).menuItems = nil
    }
}

func createMessageSoundOutgoing() -> SystemSoundID {
    var soundID: SystemSoundID = 0
    let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "MessageOutgoing", "aiff", nil)
    AudioServicesCreateSystemSoundID(soundURL, &soundID)
    return soundID
}

// Only show "Copy" when editing `textView` #CopyMessage
class InputTextView: UITextView {
    override func canPerformAction(action: Selector, withSender sender: AnyObject!) -> Bool {
        if (delegate as! ChatViewController).tableView.indexPathForSelectedRow() != nil {
            return action == "messageCopyTextAction:"
        } else {
            return super.canPerformAction(action, withSender: sender)
        }
    }
    
    // More specific than implementing `nextResponder` to return `delegate`, which might cause side effects?
    func messageCopyTextAction(menuController: UIMenuController) {
        (delegate as! ChatViewController).messageCopyTextAction(menuController)
    }
}
