//
//  Screen2ViewController.swift
//  Protocol_Sample
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import UIKit

protocol Screen2ActionDelegate: AnyObject {
    func sendValue(value: Int, target: Screen2ViewController)
}

class Screen2ViewController: UIViewController {
    @IBOutlet weak var valueTextFiled: UITextField!
    // Define pattent delegate - uy quyen
    weak var delegate: Screen2ActionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSendValue(_ sender: UIButton) {        
        let value = Int(self.valueTextFiled.text ?? "") ?? 0
        self.delegate?.sendValue(value: value, target: self)
    }
    
}
