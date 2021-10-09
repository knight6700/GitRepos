//
//  RepoDetails.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import Foundation

struct RepoDetails: Codable {
    
    var name: String?
    var owner: Owner?
    var description: String?
    var stargazersCount: Int?
    var language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        case stargazersCount = "stargazers_count"
        case language
    }
}
