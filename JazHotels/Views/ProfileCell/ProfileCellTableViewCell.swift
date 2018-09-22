//
//  ProfileCellTableViewCell.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class ProfileCellTableViewCell: UITableViewCell {
    @IBOutlet weak var attributeName: UILabel!
    
    @IBOutlet weak var attributeValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
