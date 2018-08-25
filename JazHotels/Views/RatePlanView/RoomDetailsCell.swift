//
//  RoomDetailsCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 8/23/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class RoomDetailsCell: UITableViewCell {

    @IBOutlet weak var roomDescriptionLbl: UILabel!
    @IBOutlet weak var roomNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var roomDetailsBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
