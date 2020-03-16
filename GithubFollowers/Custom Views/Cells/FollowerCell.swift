//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/5/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let resuseID = "FollowerCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        let padding: CGFloat = 8
        
        avatarImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, bottom: nil, paddingTop: padding, paddingLeft: padding, paddingRight: padding, paddingBottom: 0, width: 0, height: 0)
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor).isActive = true
        
        usernameLabel.anchor(top: avatarImageView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, bottom: nil, paddingTop: 12, paddingLeft: padding, paddingRight: padding, paddingBottom: 0, width: 0, height: 20)
    }
    
}
