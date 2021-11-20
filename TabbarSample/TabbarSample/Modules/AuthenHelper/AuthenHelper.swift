//
//  AuthenHelper.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import Foundation
import UIKit

final class AuthenHelper {
    /// Hàm check input valid
    /// - Parameters:
    ///   - email: email nhap vao
    ///   - password: password nhap vao
    /// - Returns: valid hoac khong
    class func checkValidInput(email: String?, password: String?) -> LoginErrorType {
        guard let email = email, let password = password else {
            return .nilValue
        }

        let isValidEmail = Utils.isValidEmail(email)
        if !isValidEmail {
            return .emailWrong
        }
        let isValidPassword = password.trimmingCharacters(in: .whitespacesAndNewlines).count >= 6
        if !isValidPassword {
            return .passwordWrong
        }
        return .none
    }
    
    class func showError(message: String, viewController: UIViewController) {
        let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Đã hiểu", style: .default, handler: nil))
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    class func showError(loginErrorType: LoginErrorType, viewController: UIViewController) {
        var message = ""
        switch loginErrorType {
        case .emailWrong:
            message = "Vui lòng kiểm tra lại email!"
        case .passwordWrong:
            message = "Mật khẩu phải lớn hơn hoặc bằng 6 ký tự, không có khoảng trắng!"
        case .none:
            message = ""
        case .unknow:
            message = "Loi khong xac dinh"
        case .nilValue:
            message = "Param truyen vao nil"
        }
        let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Đã hiểu", style: .default, handler: nil))
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    class func saveLoginState(isLogin: Bool) {
        UserDefaults.standard.set(isLogin, forKey: "isLogin")
    }
    
    class func getLoginState() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLogin")
    }
    
    class func saveEmail(email: String) {
        UserDefaults.standard.set(email, forKey: "email")
    }
    
    class func getEmail() -> String {
        return UserDefaults.standard.string(forKey: "email") ?? ""
    }
}
