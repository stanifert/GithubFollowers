//
//  GFUserInfoHeaderVC.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/23/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!

    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        configureComponents()
    }
    
    
    func configureComponents() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "Unknown"
        bioLabel.text = user.bio ?? "No bio"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage.init(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
    
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    
    func setConstraints() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: nil, bottom: nil, paddingTop: padding, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 90, height: 90)
        
        usernameLabel.anchor(top: avatarImageView.topAnchor, left: avatarImageView.rightAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: textImagePadding, paddingRight: 0, paddingBottom: 0, width: 0, height: 38)
        
        nameLabel.anchor(top: nil, left: avatarImageView.rightAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: textImagePadding, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8).isActive = true
        
        locationImageView.anchor(top: nil, left: avatarImageView.rightAnchor, right: nil, bottom: avatarImageView.bottomAnchor, paddingTop: 0, paddingLeft: textImagePadding, paddingRight: 0, paddingBottom: 0, width: 20, height: 20)
        
        locationLabel.anchor(top: nil, left: locationImageView.rightAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: 5, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor).isActive = true
        
        bioLabel.anchor(top: avatarImageView.bottomAnchor, left: avatarImageView.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: textImagePadding, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 60)
        
    }
    
    

}
