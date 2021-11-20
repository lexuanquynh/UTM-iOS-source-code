//
//  RegisterViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var needPopSettingScreen: (() -> Void)?
    private var activityIndicatorView: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width / 2 - 22, y: self.view.frame.height / 2 - 22, width: 45, height: 45), type: .pacman, color: UIColor.red)
        self.view.addSubview(activityIndicatorView)
    }


    @IBAction func onRegisterTouched(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
                  return
              }
        
        // Check valid input
        let errorType = AuthenHelper.checkValidInput(email: emailTextField.text, password: passwordTextField.text)
        if  errorType != .none {
            // show alert
            AuthenHelper.showError(loginErrorType: errorType, viewController: self)
            return
        }
        
        activityIndicatorView.startAnimating()
        // Register
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
            guard let strongSelf = self else {
                return
            }
            strongSelf.activityIndicatorView.stopAnimating()
            if let error = error {
                AuthenHelper.showError(message: error.localizedDescription, viewController: strongSelf)
            } else {
                // day ra man hinh setting
                AuthenHelper.saveLoginState(isLogin: true)
                AuthenHelper.saveEmail(email: email)
                strongSelf.navigationController?.popViewController(animated: true)
                strongSelf.needPopSettingScreen?()
            }
        }
    }
    
    
    @IBAction func onOpenLoginTouched(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
