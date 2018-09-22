//
//  TxtViewCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
class TxtViewCell: UITableViewCell {

    @IBOutlet weak var pinTxt: ACFloatingTextfield!
    @IBOutlet weak var expireDateTxt: ACFloatingTextfield!
    @IBOutlet weak var txtField: ACFloatingTextfield!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
