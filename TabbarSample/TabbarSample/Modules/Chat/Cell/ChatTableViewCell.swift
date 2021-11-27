//
//  ChatTableViewCell.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 27/11/2021.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var userColorView: UIView!
    
    func bindData(chatModel: ChatModel) {
        self.contentLabel.text =  chatModel.message
        self.userColorView.backgroundColor = chatModel.color
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
