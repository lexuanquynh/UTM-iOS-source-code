//
//  ViewController.swift
//  03StackView
//
//  Created by Xuân Quỳnh Lê on 2021/09/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var checkSecurityContainer: UIView!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSecurityContainer.isHidden = true
    }
    
    /// Khi bam vao nut tick
    /// - Parameter sender: sender button
    @IBAction func onTickTouched(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    /// Khi bam nut login
    /// - Parameter sender: sender button
    @IBAction func onLoginTouched(_ sender: UIButton) {
        count = count +  1
        if count == 3 {            
            UIView.animate(withDuration: 0.3) {
                self.checkSecurityContainer.isHidden = false
            }
        }
    }
}

