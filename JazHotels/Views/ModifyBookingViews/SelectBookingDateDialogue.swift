//
//  SelectBookingDateDialogue.swift
//  JazHotels
//
//  Created by Zeinab Reda on 9/22/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import DatePickerDialog

class SelectBookingDateDialogue: UIViewController {

    @IBOutlet weak var numberOfNights: UILabel!
    @IBOutlet weak var checkInDateLb: UILabel!
    @IBOutlet weak var checkOutDateLb: UILabel!
    private var dateDailog:DatePickerDialog = DatePickerDialog()
    private var checkInDate:Date?
    weak var delegate: BookingDetailsViewController?


    override func viewDidLoad() {
        super.viewDidLoad()
        checkInDate = Date()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func checkInDateBtnAction(_ sender: Any) {
        
        dateDailog.show("Select Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM, yyyy"
                self.checkInDateLb.text = formatter.string(from: dt)
                self.checkOutDateLb.text = formatter.string(from: (dt.tomorrow))
                self.numberOfNights.text = String(Helper.nightsBetweenDates(startDate: dt, endDate: dt.tomorrow))
                self.checkInDate = dt

            }
        }

    }
    
    @IBAction func checkOutDateBtnAction(_ sender: Any) {
        
        dateDailog.show("Select Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM, yyyy"
                self.checkOutDateLb.text = formatter.string(from: dt)
                self.numberOfNights.text = String(Helper.nightsBetweenDates(startDate: self.checkInDate!, endDate: dt))
            }
        }
        
    }
    @IBAction func changeDateBtnAction(_ sender: Any) {
        
        self.delegate?.getBookingDates(startDate: Helper.convertDateFormatter(date: checkInDateLb.text ?? ""), endDate: Helper.convertDateFormatter(date: checkOutDateLb.text  ?? ""), nights: numberOfNights.text ?? "")
        
        self.delegate?.dismissDialogViewController()

        
    }
}
