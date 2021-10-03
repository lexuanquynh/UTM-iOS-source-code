//
//  Configs.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

struct Configs {
    struct Network {
        // set true for tests and generating screenshots with fastlane
        public static let useStaging = false
        #if DEBUG
        public static let baseUrl = "http://156.67.214.17:8080/api/"
        #else
        public static let baseUrl = "http://156.67.214.17:8080/api/"
        #endif
    }
}
