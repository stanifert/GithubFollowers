//
//  GFItemInfoView.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/24/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}


class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage.init(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = UIImage.init(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
            
        case .followers:
            symbolImageView.image = UIImage.init(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = UIImage.init(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        countLabel.text = "\(count)"
    }
    
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        symbolImageView.anchor(top: topAnchor, left: leftAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 20, height: 20)
        titleLabel.anchor(top: nil, left: symbolImageView.rightAnchor, right: rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: 12, paddingRight: 0, paddingBottom: 0, width: 0, height: 18)
        titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor).isActive = true
        countLabel.anchor(top: symbolImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 18)
    }
    
}
