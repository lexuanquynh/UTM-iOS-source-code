//
//  AuthenService.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation


class AuthenService: BaseService {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(AuthenAPI.login(email: email, password: password)), type: LoginResponse.self) { result in
            completion(result)
        }
    }
    
    func register(email: String, password: String, name: String, completion: @escaping (Result<LoginResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(AuthenAPI.register(email: email, password: password, name: name)), type: LoginResponse.self) { result in
            completion(result)
        }
    }
}
