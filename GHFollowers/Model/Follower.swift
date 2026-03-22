//
//  Follower.swift
//  GHFollowers
//
//  Created by Giorgi Mekvabishvili on 19.03.26.
//

import Foundation


struct Follower: Codable, Sendable, Hashable {
    var login: String
    var avatarUrl: String
}
