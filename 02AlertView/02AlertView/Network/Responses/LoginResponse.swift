//
//  LoginResponse.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation

// MARK: - nullLoginResponse
struct LoginResponse: Codable {
    let status: Bool
    let error: [String]?
    let message: String
    let data: UserModel?
}

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let name, email, token: String
}
