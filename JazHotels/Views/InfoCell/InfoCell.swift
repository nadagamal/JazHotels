//
//  InfoCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/11/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

  
    @IBOutlet weak var agreeBtn: UIButton!
    @IBOutlet weak var bookingTxt: UITextView!
    @IBOutlet weak var arrivalDateTxt: UITextView!
    @IBOutlet weak var editCreditCardBtn: UIButton!
    @IBOutlet weak var cancellationsTxt: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
