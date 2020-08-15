//
//  CharacterTableViewCell.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import UIKit

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
    
    func onBind(with indexPath: IndexPath) {
        nameLabel.text = "name"
        homeworlLabel.text = "homeworld"
    }

}
