//
//  LoginViewController.swift
//  02AlertView
//
//  Created by Xuân Quỳnh Lê on 2021/09/18.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var service: AuthenService!
    var needShowUserNameAndEmail: ((_ name: String, _ email: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.service = AuthenService(isTest: false)
    }
    
    
    @IBAction func onLoginTouched(_ sender: UIButton) {
        // Check valid input
        if !Utils.isValidEmail(emailTextField.text) {
            self.showAlertWithMessage(message: "Không phải là Email. Vui lòng kiểm tra lại!")
            return
        }
        
        if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) .count == 0 {
            self.showAlertWithMessage(message: "Password rỗng! Vui lòng kiểm tra lại!")
            return
        }
        
        // Tien hanh call API
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        self.login(email: email, password: password)
    }
    
    private func showAlertWithMessage(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Hàm login
    /// - Parameters:
    ///   - email: email để login
    ///   - password: password để login
    private func login(email: String, password: String) {
        self.service.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let loginResponse):
                print("login response: \(loginResponse)")
                self?.needShowUserNameAndEmail?(loginResponse.data?.name ?? "", loginResponse.data?.email ?? "")
                self?.dismiss(animated: true, completion: nil)
//                self?.showAlertWithMessage(message: "Đăng nhập thành công!")
            case .failure:
                self?.showAlertWithMessage(message: "Đăng nhập thất bại. Vui lòng kiểm tra lại!")
            }
        }
    }
}
