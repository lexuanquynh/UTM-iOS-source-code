//
//  LeagueTableViewCell.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()      
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
