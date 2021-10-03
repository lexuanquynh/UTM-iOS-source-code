//
//  BookService.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation

class BookService: BaseService {
    func getBooks(completion: @escaping (Result<BookResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(BookAPI.getBooks), type: BookResponse.self) { result in
            completion(result)
        }
    }    
}
