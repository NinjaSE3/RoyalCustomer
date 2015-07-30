//
//  ComposeViewController.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITableViewDataSource, UITextViewDelegate {
    var searchResults: [User] = []
    var searchResultsTableView = UITableView(frame: CGRectZero, style: .Plain)
    var toTextView = UITextView(frame: CGRectZero)
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        automaticallyAdjustsScrollViewInsets = false
        title = "New Message"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancelAction")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        toTextView.backgroundColor = UIColor(white: 248/255, alpha: 1)
        let attributedString = NSMutableAttributedString(string: "To: ")
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1), range: NSMakeRange(0, 3))
        toTextView.attributedText = attributedString
        toTextView.font = UIFont.systemFontOfSize(15)
        toTextView.contentInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 0)
        view.addSubview(toTextView)
        
        searchResultsTableView.frame = view.bounds
        searchResultsTableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        searchResultsTableView.dataSource = self
        searchResultsTableView.hidden = true
        searchResultsTableView.keyboardDismissMode = .OnDrag
        searchResultsTableView.scrollsToTop = false
        searchResultsTableView.registerClass(UserTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UserTableViewCell))
        view.addSubview(searchResultsTableView)
        
        toTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(item: toTextView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: toTextView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: toTextView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1, constant: 0))
        toTextView.addConstraint(NSLayoutConstraint(item: toTextView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let alertView = UIAlertView(title: "", message: "This page doesn't work yet.", delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(UserTableViewCell), forIndexPath: indexPath) as! UserTableViewCell
        let user = searchResults[indexPath.row]
        if let pictureName = user.pictureName() {
            cell.pictureImageView.image = UIImage(named: pictureName)
        } else {
            cell.pictureImageView.image = nil
        }
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = "$" + user.username
        return cell
    }
    
    // MARK: - UITextViewDelegate
    
    func textViewDidChange(textView: UITextView) {
        println(textView.text)
    }
    
    // MARK: - Actions
    
    func cancelAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
