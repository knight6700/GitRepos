//
//  ReposService.swift
//  GitReposSearch
//
//  Created by Mahmoud on 8/10/2021.
//

import Foundation
import Moya

enum ReposService: TargetType {
    
    case repositories(keyword: String, page: Int)
    
    var baseURL: URL {
        return URL (string: "https://api.github.com/")!
    }
    
    var path: String {
        switch  self {
        case .repositories:
            return "search/repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .repositories:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .repositories(let keyword, let page):
            return Task.requestParameters(parameters: ["page": page, "q":keyword, "type": "users"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

