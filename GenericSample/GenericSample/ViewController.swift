//
//  ViewController.swift
//  GenericSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {
//    let catKeeperKind = KeeperKind(kindOf: .dog)
//    let cat = Cat(name: "Tom")
//    let dog = Dog(name: "ABC")
//    let keeper = Keeper<Cat>(name: "Tom")
    
    var sampleDic = DictionarySample()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleDic.makeArray()
        
//        print("cat \(keeper.name)")
//        switch catKeeperKind.kindOf {
//        case .cat:
//            print("Day la con meo")
//        case .dog:
//            print("Day la con cho")
//        }
    }


}

