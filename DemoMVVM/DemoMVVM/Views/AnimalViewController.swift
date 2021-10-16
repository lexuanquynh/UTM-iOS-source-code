//
//  ViewController.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import UIKit

class AnimalViewController: UIViewController {
    @IBOutlet weak var animalTableView: UITableView!
    private var viewmodel = AnimalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
    }

    private func initTableView() {
        animalTableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimalTableViewCell")
        animalTableView.delegate = self
        animalTableView.dataSource = self
    }
}

extension AnimalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell") as! AnimalTableViewCell
        cell.bindData(data: self.viewmodel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
