//
//  UserTableViewCell.swift
//  RoyalCustomer
//
//  Created by Takaaki on 2015/07/29.
//  Copyright (c) 2015年 NRI. All rights reserved.
//

import UIKit

let userTableViewCellHeight: CGFloat = 56.5

class UserTableViewCell: UITableViewCell {
    let pictureImageView: UIImageView
    let nameLabel: UILabel
    let usernameLabel: UILabel
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        let pictureSize = userTableViewCellHeight - 0.5
        pictureImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: pictureSize, height: pictureSize))
        pictureImageView.backgroundColor = UIColor(white: 238/255, alpha: 1)
        
        nameLabel = UILabel(frame: CGRectZero)
        nameLabel.autoresizingMask = .FlexibleWidth
        //        nameLabel.backgroundColor = UIColor.orangeColor()
        nameLabel.font = UIFont.systemFontOfSize(17)
        
        usernameLabel = UILabel(frame: CGRectZero)
        usernameLabel.autoresizingMask = .FlexibleWidth
        //        usernameLabel.backgroundColor = UIColor.orangeColor()
        usernameLabel.font = UIFont.systemFontOfSize(15)
        usernameLabel.textColor = UIColor(white: 143/255, alpha: 1)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.frame = CGRect(x: userTableViewCellHeight+10, y: 7, width: contentView.frame.width, height: 22)
        usernameLabel.frame = CGRect(x: userTableViewCellHeight+10, y: 29, width: contentView.frame.width, height: 20)
        self.addSubview(pictureImageView)
        self.addSubview(nameLabel)
        self.addSubview(usernameLabel)
    }
}
