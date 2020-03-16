//
//  User.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/1/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
    
}
