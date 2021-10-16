//
//  TodayView.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit

protocol TodayViewDelegate: AnyObject {
    func didSearch(text: String)
}

class TodayView: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    weak var delegate: TodayViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// Common init view
    private func commonInit() {
        // Init view
        Bundle.main.loadNibNamed("TodayView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

//        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
//        let image = UIImage(named: "search")
//        imageView.image = image
//        imageView.contentMode = .scaleAspectFit
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
//        view.addSubview(imageView)
//        searchTextFiled.rightViewMode = UITextField.ViewMode.always
//        searchTextFiled.rightView = view
    }
    
    @IBAction func onSearchAction(_ sender: UIButton) {
        if let text = searchTextFiled.text {
            self.delegate?.didSearch(text: text)
        }
        
    }
    
}

