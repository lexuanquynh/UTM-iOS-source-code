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

        initTableView()
        bindViewModel()
    }

    private func initTableView() {
        chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.estimatedRowHeight = 1000
        chatTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        viewModel = ChatViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.chatTableView.reloadData()
        }
        viewModel.getData()
    }
    
    @IBAction func sendButtonTouched(_ sender: Any) {
        guard let message = contetnTextField.text else {
            return
        }
        viewModel.sendMessage(message: message)
    }        
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as! ChatTableViewCell
        cell.bindData(chatModel: self.viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    
}
