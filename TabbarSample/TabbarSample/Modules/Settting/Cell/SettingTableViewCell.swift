//
//  SettingTableViewCell.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    @IBOutlet weak var logoImageView: UIImageView!    
    @IBOutlet weak var settingLabel: UILabel!
    
    func bindData(data: SettingModel) {
        logoImageView.image = UIImage(named: data.image)
        settingLabel.text = data.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
