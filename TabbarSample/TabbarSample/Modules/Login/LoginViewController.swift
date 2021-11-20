//
//  LoginViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var activityIndicatorView: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width / 2 - 22, y: self.view.frame.height / 2 - 22, width: 45, height: 45), type: .pacman, color: UIColor.red)
        self.view.addSubview(activityIndicatorView)
    }
    
    
    
    @IBAction func onLoginTouched(_ sender: Any) {
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
        
        // call firebase for login
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            guard let strongSelf = self else {
                return
            }
            strongSelf.activityIndicatorView.stopAnimating()
            if let error = error {
                AuthenHelper.showError(message: error.localizedDescription, viewController: strongSelf)
            } else {
                AuthenHelper.saveLoginState(isLogin: true)
                AuthenHelper.saveEmail(email: email)
                // day ra man hinh setting
                strongSelf.navigationController?.popViewController(animated: true)               
            }
        }
        
    }        
    
    @IBAction func onOpenRegisterTouched(_ sender: Any) {
        let registerViewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        registerViewController.needPopSettingScreen = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }

}
