//
//  ViewController.swift
//  Protocol_Sample
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initScreen2()
    }
    
    private func initScreen2() {
        let screen2ViewController = Screen2ViewController(nibName: "Screen2ViewController", bundle: nil)
        containerView.addSubview(screen2ViewController.view)
        self.addChild(screen2ViewController)
        screen2ViewController.didMove(toParent: self)
        
        // uy quyen delegate
        screen2ViewController.delegate = self
        screen2ViewController.view.isUserInteractionEnabled = true
        
        // Add contraints
        screen2ViewController.view.translatesAutoresizingMaskIntoConstraints = false
        screen2ViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        screen2ViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        screen2ViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        screen2ViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
}

extension ViewController: Screen2ActionDelegate {
    func sendValue(value: Int, target: Screen2ViewController) {
        self.valueLabel.text = String(value)
    }
}
