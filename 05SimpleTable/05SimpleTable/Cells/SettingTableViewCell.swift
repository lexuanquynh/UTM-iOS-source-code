//
//  SettingTableViewCell.swift
//  05SimpleTable
//
//  Created by Xuân Quỳnh Lê on 2021/09/25.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var settingImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(systemName: String, title: String) {
        contentLabel.text = title
        settingImageView.image = UIImage(systemName: systemName)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
