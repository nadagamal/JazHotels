//
//  RatePlanTableViewCell.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class RatePlanTableViewCell: UITableViewCell {

    @IBOutlet weak var ratePrice: UILabel!
    @IBOutlet weak var rateTitle: UILabel!
    @IBOutlet weak var rateDesc: UILabel!
    @IBOutlet weak var avaiableRoomBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func avaiableRoomBtnAction(_ sender: Any) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
