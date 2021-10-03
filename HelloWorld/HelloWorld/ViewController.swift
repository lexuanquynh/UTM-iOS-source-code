//
//  ViewController.swift
//  HelloWorld
//
//  Created by Xuân Quỳnh Lê on 2021/09/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var amduongButton: UIButton!
    @IBOutlet weak var phantramButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fineButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var chiaButton: UIButton!
    @IBOutlet weak var nhanButton: UIButton!
    @IBOutlet weak var truButton: UIButton!
    @IBOutlet weak var congButton: UIButton!
    @IBOutlet weak var bangButton: UIButton!
    @IBOutlet weak var ketQuaLabel: UILabel!
    
    var ketqua: Float = 0.0
    var tempNum: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        acButton.layer.cornerRadius = acButton.bounds.width / 2
        amduongButton.layer.cornerRadius = amduongButton.bounds.width / 2
        phantramButton.layer.cornerRadius = phantramButton.bounds.width / 2
        zeroButton.layer.cornerRadius = zeroButton.bounds.width / 2
        zeroButton.layer.cornerRadius = zeroButton.bounds.height / 2
        oneButton.layer.cornerRadius = oneButton.bounds.width / 2
        twoButton.layer.cornerRadius = twoButton.bounds.width / 2
        threeButton.layer.cornerRadius = threeButton.bounds.width / 2
        fourButton.layer.cornerRadius = fourButton.bounds.width / 2
        fineButton.layer.cornerRadius = fineButton.bounds.width / 2
        sixButton.layer.cornerRadius = sixButton.bounds.width / 2
        sevenButton.layer.cornerRadius = sevenButton.bounds.width / 2
        eightButton.layer.cornerRadius = eightButton.bounds.width / 2
        nightButton.layer.cornerRadius = nightButton.bounds.width / 2
        dotButton.layer.cornerRadius = dotButton.bounds.width / 2
        chiaButton.layer.cornerRadius = chiaButton.bounds.width / 2
        nhanButton.layer.cornerRadius = nhanButton.bounds.width / 2
        truButton.layer.cornerRadius = truButton.bounds.width / 2
        congButton.layer.cornerRadius = congButton.bounds.width / 2
        bangButton.layer.cornerRadius = bangButton.bounds.width / 2
        ketQuaLabel.layer.cornerRadius = ketQuaLabel.bounds.width / 2
    }
    
    @IBAction func onNumberTouched(_ sender: UIButton) {
        print("tag = \(sender.tag)")
    }
    
    
    @IBAction func onDotTouched(_ sender: UIButton) {
        print("dot")
    }
    
    @IBAction func onChiaTouched(_ sender: UIButton) {
        print("chia")
    }
 
    @IBAction func onNhanTouched(_ sender: UIButton) {
        print("Nhan")
    }
    
    @IBAction func onTruTouched(_ sender: UIButton) {
        print("Tru")
    }
    
    @IBAction func onCongTouched(_ sender: UIButton) {
        print("cong")
    }
    
    @IBAction func onBangTouched(_ sender: UIButton) {
        print("bang")
    }
    
    
    @IBAction func onACTouched(_ sender: UIButton) {
        print("AC")
    }
    
    @IBAction func onAmDuongTouched(_ sender: UIButton) {
        print("Am duong")
    }
    
    @IBAction func onPhanTramTouched(_ sender: UIButton) {
        print("Phan tram")
    }
}

