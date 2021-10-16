//
//  Animal.swift
//  GenericSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import Foundation

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var kindOf: PetKind
}


class Cat {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
}

class Dog {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
}

class Keeper<Animal> {
  var name: String
    
  init(name: String) {
    self.name = name
  }
}
