//
//  ChatViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import UIKit

class ChatViewController: UIViewController {
    private var viewModel: ChatViewModel!
    
    @IBOutlet weak var contetnTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }

    private func bindViewModel() {
        viewModel = ChatViewModel()
        viewModel.getData()
    }
    @IBAction func sendButtonTouched(_ sender: Any) {
        guard let message = contetnTextField.text else {
            return
        }
        viewModel.sendMessage(message: message)
    }        
}
