//
//  SettingModel.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import Foundation

enum SettingType {
    case loginRegister
    case notification
    case loginSuccess
}

struct SettingModel {
    let image: String
    let title: String
    let settingType: SettingType
}
