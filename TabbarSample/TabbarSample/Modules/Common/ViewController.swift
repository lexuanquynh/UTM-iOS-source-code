//
//  ViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bgImage  = UIImage(named: "background")
        let imageBackgroundView = UIImageView(image: bgImage)
        imageBackgroundView.contentMode = .scaleAspectFill
        self.view.addSubview(imageBackgroundView)
        self.view.sendSubviewToBack(imageBackgroundView)
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageBackgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageBackgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }

}
