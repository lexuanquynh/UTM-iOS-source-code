//
//  GithubViewController.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import UIKit

class GithubViewController: UIViewController {
    @IBOutlet weak var githubTableView: UITableView!
    
    private var viewModel: GithubViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTableView()
        self.bindViewModel()
    }

    private func initTableView() {
        self.githubTableView.register(UINib(nibName: "GithubTableViewCell", bundle: nil), forCellReuseIdentifier: "GithubTableViewCell")
        self.githubTableView.dataSource = self
        self.githubTableView.delegate = self
    }
    
    private func bindViewModel() {
        self.viewModel = GithubViewModel()
        
    }
}

extension GithubViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GithubTableViewCell") as! GithubTableViewCell
        return cell
//        self.viewModel.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
