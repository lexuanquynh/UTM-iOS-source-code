//
//  GithubViewModel.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import Foundation

struct GithubViewModel {
    private var service: GithubService
    
    init() {
        self.service = GithubService()
        self.searchRepositories()
    }
    
    func searchRepositories() {
        let query = "language:swift"
        let sort = "stars"
        let order = "desc"
        self.service.searchRepositories(query: query, sort: sort, order: order)
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return 10
    }
    
//    func cellForRowAt(indexPath: IndexPath) -> RepositoryModel {
//        return animals[indexPath.row]
//    }
//
}
