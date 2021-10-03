//
//  Utils.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import Foundation


class Utils {
    /// Ham check co phai email hay khong
    /// - Parameter email: email truyen vao
    /// - Returns: la email hoac khong
    static func isValidEmail(_ email: String?) -> Bool {
        if email == nil {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
