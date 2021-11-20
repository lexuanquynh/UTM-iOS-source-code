//
//  SettingViewModel.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import Foundation

class SettingViewModel {
    private var loginState = AuthenHelper.getLoginState()
    var needReloadTableView: (() -> Void)?
    
    private var dataSource: [SettingModel] = [
        SettingModel(image: "login", title: "Đăng nhập", settingType: .loginRegister),
        SettingModel(image: "alarm_b", title: "Thông báo", settingType: .notification),
    ]
    
    init() {
        resetSateLogin()
    }
    
    func resetSateLogin() {
        loginState = AuthenHelper.getLoginState()
        if loginState == true {
        dataSource = [
            SettingModel(image: "login", title: "Đăng xuất", settingType: .loginSuccess),
            SettingModel(image: "alarm_b", title: "Thông báo", settingType: .notification),
        ]
        } else {
        dataSource = [
            SettingModel(image: "login", title: "Đăng nhập", settingType: .loginRegister),
            SettingModel(image: "alarm_b", title: "Thông báo", settingType: .notification),
        ]
        }
        needReloadTableView?()
    }
    func numberOfRowsInSection() -> Int {
        return dataSource.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> SettingModel {
        return dataSource[indexPath.row]
    }
}
