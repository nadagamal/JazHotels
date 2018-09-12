//
//  MenuCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/12/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var cellIconImg: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
