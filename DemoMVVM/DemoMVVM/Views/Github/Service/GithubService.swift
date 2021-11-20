//
//  GithubService.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import Foundation

class GithubService: BaseService {
    func searchRepositories(query: String, sort: String, order: String) {
        self.provider.request(MultiTarget(GithubAPI.searchRepositories(query: query, sort: sort, order: order)), type: GithubModel.self) { response in
            print("repoonse = \(response)")
        }
    }
}
