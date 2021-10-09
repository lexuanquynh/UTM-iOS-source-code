//
//  HomeViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit

class HomeViewController: ViewController {
    @IBOutlet weak var leagueTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTableView()            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func initTableView() {
        leagueTableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueTableViewCell")
        self.leagueTableView.separatorStyle = .none
        leagueTableView.dataSource = self
        leagueTableView.delegate = self
        
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell") as! LeagueTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailLeagueViewController = DetailLeagueViewController(nibName: "DetailLeagueViewController", bundle: nil)
        self.navigationController?.pushViewController(detailLeagueViewController, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
