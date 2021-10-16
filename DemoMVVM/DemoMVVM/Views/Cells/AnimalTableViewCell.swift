//
//  AnimalTableViewCell.swift
//  DemoMVVM
//
//  Created by Xuân Quỳnh Lê on 2021/10/16.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    /// Them data cho cell
    /// - Parameter data: data animal
    func bindData(data: Animal) {
        animalLabel.text = data.name
        if let image = UIImage(named: data.image) {
            animalImageView.image = image
            animalImageView.setImageColor(color: data.color)
        }
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
