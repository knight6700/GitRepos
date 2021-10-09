//
//  AllReposResponse.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import Foundation

struct AllReposResponse: Codable {
    let items: [RepoDetails]?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
}
