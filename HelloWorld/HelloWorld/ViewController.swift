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
    var priviousNumber: Float = 0.0
    
    enum PhepTinh {
        case cong
        case tru
        case nhan
        case chia
        case tinhtoan
        case none
    }
    
    var currentPhepTinh: PhepTinh = .none
    
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
        // Chuyen kieu int sang kieu string
        if currentPhepTinh == .none {
            let ketqua = getNewValue(text: self.ketQuaLabel.text, temp: sender.tag)
            self.ketQuaLabel.text = "\(ketqua)"
        } else { // da thuc hien phep tinh
            if  currentPhepTinh == .tinhtoan {
                // Truong hop khi vua xu ly xong phep toan
                self.ketQuaLabel.text = "0"
                currentPhepTinh = .none
            }
            if self.priviousNumber == 0 {
                self.priviousNumber = Float(self.ketQuaLabel.text ?? "") ?? 0
                self.ketQuaLabel.text = "0"
            }
            let ketqua = getNewValue(text: self.ketQuaLabel.text, temp: sender.tag)
            self.ketQuaLabel.text = "\(ketqua)"
        }
        
    }
    
    /// Hàm lấy giá trị của phép tính khi bấm vào button số
    /// - Parameters:
    ///   - text: text trên ô kết quả
    ///   - temp: temp giá trị tag của button bấm vào
    /// - Returns: hiện tại của text
    func getNewValue(text: String?, temp: Int) -> Float {
        let currentValue = Float(text ?? "") ?? 0
        return Float(Int(currentValue) * 10 + temp)
    }
    
    @IBAction func onDotTouched(_ sender: UIButton) {
        print("dot")
    }
    
    @IBAction func onChiaTouched(_ sender: UIButton) {
        currentPhepTinh = .chia
        
    }
 
    @IBAction func onNhanTouched(_ sender: UIButton) {
        currentPhepTinh = .nhan
    }
    
    @IBAction func onTruTouched(_ sender: UIButton) {
        currentPhepTinh = .tru
    }
    
    @IBAction func onCongTouched(_ sender: UIButton) {
        currentPhepTinh = .cong
    }
    
    @IBAction func onBangTouched(_ sender: UIButton) {
        currentPhepTinh = .tinhtoan
        // Xu ly tinh toan
        let currentNumber = Float(self.ketQuaLabel.text ?? "") ?? 0
        let result = self.priviousNumber * currentNumber
        self.ketQuaLabel.text = "\(result)"
        // reset ket qua
        self.priviousNumber = 0.0
    }
    
    
    @IBAction func onACTouched(_ sender: UIButton) {
        self.ketQuaLabel.text = "0.0"
    }
    
    @IBAction func onAmDuongTouched(_ sender: UIButton) {
        print("Am duong")
    }
    
    @IBAction func onPhanTramTouched(_ sender: UIButton) {
        print("Phan tram")
    }
}

