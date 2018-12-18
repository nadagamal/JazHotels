//
//  CreditCardCell.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Caishen
import FormTextField
class CreditCardCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var cardExpirationDateTxt: FormTextField!
    @IBOutlet weak var cardNameTxt: FormTextField!
    @IBOutlet weak var cardYearTxt: FormTextField!
    @IBOutlet weak var cardNumberTxt: FormTextField!
    @IBOutlet weak var cvcTxt: FormTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        Helper.addLineToView(view: cardNumberTxt, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.4)
        Helper.addLineToView(view: cardNameTxt, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.4)
        Helper.addLineToView(view: cardExpirationDateTxt, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.4)
        Helper.addLineToView(view: cvcTxt, position:.LINE_POSITION_BOTTOM, color: UIColor.lightGray, width: 0.4)
        cardNameTxt.textFieldDelegate = self

        // Card Number
        cardNumberTxt.inputType = .integer
        cardNumberTxt.formatter = CardNumberFormatter()
        cardNumberTxt.placeholder = "Card Number"
        cardNumberTxt.textFieldDelegate = self
        var validation = Validation()
        validation.maximumLength = "1234 5678 1234 5678".count
        validation.minimumLength = "1234 5678 1234 5678".count
        let characterSet = NSMutableCharacterSet.decimalDigit()
        characterSet.addCharacters(in: " ")
        validation.characterSet = characterSet as CharacterSet
        let inputValidator = InputValidator(validation: validation)
        cardNumberTxt.inputValidator = inputValidator
        
        
        // CVC
        
        cvcTxt.inputType = .integer
        cvcTxt.formatter = CardNumberFormatter()
        cvcTxt.placeholder = "CVC"
        
        var validation2 = Validation()
        validation2.maximumLength = "CVC".count
        validation2.minimumLength = "CVC".count
        validation2.characterSet = NSCharacterSet.decimalDigits
        let inputValidator2 = InputValidator(validation: validation2)
        cvcTxt.inputValidator = inputValidator2
        cvcTxt.textFieldDelegate = self

        // Expire Date
        
        cardExpirationDateTxt.inputType = .integer
        cardExpirationDateTxt.formatter = CardExpirationDateFormatter()
       cardExpirationDateTxt.placeholder = "Expiration Date (MM/YY)"
        cardExpirationDateTxt.textFieldDelegate = self

        var validation3 = Validation()
        validation3.minimumLength = "MM/YY".count
        validation3.maximumLength = "MM/YY".count
        let inputValidator3 = CardExpirationDateInputValidator(validation: validation3)
        cardExpirationDateTxt.inputValidator = inputValidator3
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
extension CreditCardCell:FormTextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func formTextFieldDidEndEditing(_ textField: FormTextField) {
        let userData = UserDefaults.getObjectDefault(key: HotelJazConstants.userDefault.userData) as? UserProfile

        let userPaymentCard = userData?.userCardPayment
        if textField.text != ""{
            if textField == self.cardNameTxt{
                userPaymentCard?.cardHolderName = self.cardNameTxt.text
            }
            else  if textField == self.cardNumberTxt{
                userPaymentCard?.cardNumber = self.cardNumberTxt.text
            }
            else  if textField == self.cardExpirationDateTxt{
                userPaymentCard?.expireDate = self.cardExpirationDateTxt.text
            }
            else  if textField == self.cvcTxt{
                userPaymentCard?.seriesCode = self.cvcTxt.text
            }
            UserOperation.saveUserCreditCard(paymentCard: userPaymentCard!)
            
        }
    }
}
