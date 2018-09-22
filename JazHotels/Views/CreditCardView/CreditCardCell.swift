//
//  CreditCardCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Caishen
class CreditCardCell: UITableViewCell {

    @IBOutlet weak var cardMonthTxt: MonthInputTextField!
    @IBOutlet weak var cardNameTxt: UITextField!
    @IBOutlet weak var cardYearTxt: YearInputTextField!
    @IBOutlet weak var cardNumberTxt: NumberInputTextField!
    @IBOutlet weak var cvcTxt: CVCInputTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
