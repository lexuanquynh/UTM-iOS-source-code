//
//  GithubTableViewCell.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/23.
//

import UIKit
import Kingfisher

class GithubTableViewCell: UITableViewCell {
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var repositoryLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func bindData(repository: RepositoryModel) {
        self.ownerLabel.text = repository.owner?.login
        self.repositoryLabel.text = repository.name
        
        if let owner = repository.owner,
           let avatarString = owner.avatarUrl,
           let avatarUrl = URL(string: avatarString) {
            self.avatarImageView.kf.setImage(with: avatarUrl)
        }
    }
}
