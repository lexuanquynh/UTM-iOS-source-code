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
        public static var useStaging = false
        #if DEBUG
        public static var baseUrl = "https://api.github.com/"
        #else
        public static var baseUrl = "https://api.github.com/"
        #endif
    }
}
