//
//  MainViewController.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onShowGithubTouched(_ sender: UIButton) {
        let githubViewController = GithubViewController(nibName: "GithubViewController", bundle: nil)
        self.navigationController?.pushViewController(githubViewController, animated: true)
    }
    
}
