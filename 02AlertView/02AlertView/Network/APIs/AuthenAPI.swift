//
//  AuthenAPI.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation
import Moya

enum AuthenAPI {
    case login(email: String, password: String)
    case register(email: String, password: String, name: String)
}

extension AuthenAPI: TargetType {
    var baseURL: URL {
        let url = URL(string: Configs.Network.baseUrl)!
        return url
    }

    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .register:
            return "auth/register"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        var dataUrl: URL?

        switch self {
        case .login:
            if let file = Bundle.main.url(forResource: "LoginResponse", withExtension: "json") {
                dataUrl = file
            }
        case .register:
            if let file = Bundle.main.url(forResource: "RegisterResponse", withExtension: "json") {
                dataUrl = file
            }
        }
        if let url = dataUrl, let data = try? Data(contentsOf: url) {
            return data
        }

        return Data()
    }

    var task: Task {
        switch self {
        case .login, .register:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: jsonEncoding)
            }
        }
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var parameters: [String: Any]? {
        var params: [String: Any] = [:]

        switch self {
        case .login(let email, let password):
            params["email"] = email
            params["password"] = password
        case .register(let email, let password, let name):
            params["email"] = email
            params["password"] = password
            params["name"] = name
        }

        return params
    }

    // For json encode. Use in post request
    var jsonEncoding: JSONEncoding {
        return JSONEncoding.default
    }

    // For param encode. Use in get request
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}

