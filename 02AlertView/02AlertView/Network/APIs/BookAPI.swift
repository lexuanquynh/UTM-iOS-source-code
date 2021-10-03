//
//  BookAPI.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation
import Moya

enum BookAPI {
    case getBooks
}

extension BookAPI: TargetType {
    var baseURL: URL {
        let url = URL(string: Configs.Network.baseUrl)!
        return url
    }

    var path: String {
        switch self {
        case .getBooks:
            return "books"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        var dataUrl: URL?

        switch self {
        case .getBooks:
            if let file = Bundle.main.url(forResource: "GetBookResponse", withExtension: "json") {
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
        case .getBooks:
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
        case .getBooks:
            break
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

