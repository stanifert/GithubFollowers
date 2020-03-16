//
//  Follower.swift
//  GithubFollowers
//
//  Created by Travis W. Stanifer on 1/1/20.
//  Copyright © 2020 Travis Stanifer. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    
    var login: String
    var avatarUrl: String
}
