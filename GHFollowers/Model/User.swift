//
//  User.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 19.03.26.
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
    let hmtmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
