//
//  CharacterTableViewCell.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    
    static let reuseIdentidier = "characterCell"

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onBind(with item: Character) {
        nameLabel.text = item.name
        switch item.homeworld {
        case .string(let planet):
            homeworlLabel.text = planet.capitalized
        case .stringArray(let planets):
            homeworlLabel.text = planets.first?.capitalized
        default:
            homeworlLabel.text = ""
        }
        let imageURL = URL(string: item.avatar)
        avatarImage.sd_setImage(with: imageURL, completed: nil)
    }

}
