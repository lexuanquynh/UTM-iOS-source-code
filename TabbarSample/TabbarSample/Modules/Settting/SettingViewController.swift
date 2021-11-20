//
//  SettingViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit
import FirebaseAuth

class SettingViewController: ViewController {

    @IBOutlet weak var settingTableView: UITableView!
    private var viewModel: SettingViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.resetSateLogin()
    }
    
    private func initTableView() {
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel = SettingViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.settingTableView.reloadData()
        }
    }
    
    func handleOpenScreen(settingType: SettingType) {
        switch settingType {
        case .loginRegister:
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            self.navigationController?.pushViewController(loginViewController, animated: true)
        case .notification:
            break
        case .loginSuccess:
            self.handleLogout()
        }
    }
    
    private func handleLogout() {
        let alertVC = UIAlertController(title: "", message: "Bạn có muốn đăng xuất không?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Có", style: .cancel, handler: { _ in
            //
            AuthenHelper.saveLoginState(isLogin: false)
            // Logout
            try! FirebaseAuth.Auth.auth().signOut()
            // Reload tableview
            self.viewModel.resetSateLogin()
        }))
        alertVC.addAction(UIAlertAction(title: "không", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleOpenScreen(settingType: viewModel.cellForRowAt(indexPath: indexPath).settingType)
    }
}
