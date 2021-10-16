//
//  DictionarySample.swift
//  GenericSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import Foundation

class DictionarySample {
    /*
     key - value
     non-sql -> save database: mongdb, firebase, ...
     sql:
     */
    
    
    
    func makeDic() {
        var sameDic: [String: String] = [:]
        sameDic["vn"] = "Viet Nam"
        sameDic["abc"] = "Day la abc"
        print(sameDic["abc"])
    }
    
    func makeArray() {
        var numberArr: [Int] = []
//        var dicArr: [[String: String]] = []
        numberArr.append(12)
        numberArr.append(2)
        
//        for element in numberArr {
//            print(element)
//        }
        
//        for (index, element) in numberArr.enumerated() {
//            print("index: \(index)")
//            print("element: \(element)")
//            if index == 10 {
//                break
//            }
//        }
        
        // high function
        numberArr.forEach { element in
            print("element: \(element)")
        }
    }
}
