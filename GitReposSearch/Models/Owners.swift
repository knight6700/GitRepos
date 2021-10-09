//
//  Owners.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import Foundation

import Foundation

struct Owner: Codable {
    var login: String?
    var avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
