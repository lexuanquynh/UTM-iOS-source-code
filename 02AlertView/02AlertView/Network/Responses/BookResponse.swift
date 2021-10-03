//
//  BookResponse.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let status: Bool
    let error: [String]?
    let message: String
    let data: [BookModel]
}

// MARK: - BookModel
struct BookModel: Codable {
    let id: Int
    let title, datumDescription: String
    let user: UserModel

    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case user
    }
}
