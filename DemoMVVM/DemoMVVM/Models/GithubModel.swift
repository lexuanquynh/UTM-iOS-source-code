//
//  GithubModel.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import Foundation

struct GithubModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [RepositoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct RepositoryModel: Codable {
    let id: String?
    let name: String?
    let fullName: String?
    let owner: Owner?
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner
        case fullName = "full_name"
    }
}

struct Owner: Codable {
    let login: String?
    let id: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
    }
}
