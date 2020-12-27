//
//  MealTableViewCell.swift
//  SecondStageTest
//
//  Created by Yogi Priyo Prayogo on 27/12/20.
//  Copyright © 2020 Yogi Priyo Prayogo. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
