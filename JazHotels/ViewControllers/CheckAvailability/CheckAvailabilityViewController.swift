//
//  CheckAvailabilityViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import iOSDropDown
import DatePickerDialog
import SCLAlertView
import SIAlertView
import SVProgressHUD


class CheckAvailabilityViewController: UIViewController , UIScrollViewDelegate  {
    @IBOutlet weak var hotelSearchTF: DropDown!
    @IBOutlet weak var numberOfNightsLb: UILabel!
    @IBOutlet weak var numberOfRoomLb: UILabel!
    @IBOutlet weak var checkInDateLb: UILabel!
    @IBOutlet weak var checkoutDateLb: UILabel!
    @IBOutlet weak var numberOfAdultsLb: UILabel!
    @IBOutlet weak var numberOfChildsLb: UILabel!
    @IBOutlet weak var decreaseRoomsBtn: UIButton!
    @IBOutlet weak var increaseRoomsBtn: UIButton!
    @IBOutlet weak var increaseAdultssBtn: UIButton!
    @IBOutlet weak var decreaseAdultssBtn: UIButton!
    @IBOutlet weak var increaseChildsBtn: UIButton!
    @IBOutlet weak var decreaseChildsBtn: UIButton!
    private var selectedHotelCode:String = ""
    private var dateDailog:DatePickerDialog = DatePickerDialog()
    private var startDate:String?
    private var checkInDate:Date?
    private var endDate:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView()
    {
        hotelSearchTF.isSearchEnable =  true
        hotelSearchTF.optionArray = JazHotels.hotelsName ?? []
        hotelSearchTF.optionIds = JazHotels.hotelsCode ?? []
        hotelSearchTF.didSelect{(selectedHotel , index , id) in
           
            print("Selected Hotel: \(selectedHotel) \n index: \(index) \n Id: \(id)")
            self.selectedHotelCode = String(id)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        checkInDateLb.text = formatter.string(from: Date())
        checkoutDateLb.text = formatter.string(from: Date().tomorrow)
        checkInDate = Date()
        startDate = checkInDateLb.text
        endDate = checkoutDateLb.text
        numberOfNightsLb.text = String(Helper.nightsBetweenDates(startDate: Date(), endDate: Date().tomorrow))

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func checkInDateAction(_ sender: Any)
    {
        dateDailog.show("Select Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM, yyyy"
                self.checkInDateLb.text = formatter.string(from: dt)
                self.checkoutDateLb.text = formatter.string(from: (dt.tomorrow))
                self.numberOfNightsLb.text = String(Helper.nightsBetweenDates(startDate: dt, endDate: dt.tomorrow))
                self.startDate = self.checkInDateLb.text
                self.checkInDate = dt
                self.endDate = self.checkoutDateLb.text

                
            }
        }
    }
    
    
    @IBAction func checkOutDateAction(_ sender: Any)
    {
        dateDailog.show("Select Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM, yyyy"
                self.checkoutDateLb.text = formatter.string(from: dt)
                self.numberOfNightsLb.text = String(Helper.nightsBetweenDates(startDate: self.checkInDate!, endDate: dt))
                self.endDate = self.checkoutDateLb.text
            }
        }
    }
    
    @IBAction func gpsBtnAction(_ sender: Any) {
    }
    
    @IBAction func decreaseNumberOfRoomAction(_ sender: Any) {
        numberOfRoomLb.text =  String(Int(numberOfRoomLb.text!)! - 1)
        if Int(numberOfRoomLb.text!)! == 1
        {
            decreaseRoomsBtn.isEnabled = false
            decreaseRoomsBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)
        }
        if Int(numberOfRoomLb.text!)! <= 2
        {
            increaseRoomsBtn.isEnabled = true
            increaseRoomsBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        }
    }
    
    @IBAction func increaseNumberOfRoomAction(_ sender: Any) {
        
        numberOfRoomLb.text =  String(Int(numberOfRoomLb.text!)! + 1)
        if Int(numberOfRoomLb.text!)! > 1
        {
            decreaseRoomsBtn.isEnabled = true
            decreaseRoomsBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        }
        if Int(numberOfRoomLb.text!)! == 3
        {
            increaseRoomsBtn.isEnabled = false
            increaseRoomsBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)
        }
        
    }
    
    @IBAction func increaseNumberOfAdultsAction(_ sender: Any)
    {
        numberOfAdultsLb.text =  String(Int(numberOfAdultsLb.text!)! + 1)
        if Int(numberOfAdultsLb.text!)! > 1
        {
            decreaseAdultssBtn.isEnabled = true
            decreaseAdultssBtn.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            decreaseAdultssBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)

        }
        if Int(numberOfAdultsLb.text!)! == 3
        {
            increaseAdultssBtn.isEnabled = false
            increaseAdultssBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)

        }
    }
    
    @IBAction func decreaseNumberOfAdultsAction(_ sender: Any)
    {
        numberOfAdultsLb.text =  String(Int(numberOfAdultsLb.text!)! - 1)
        if Int(numberOfAdultsLb.text!)! == 1
        {
            decreaseAdultssBtn.isEnabled = false
            decreaseAdultssBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)
        }
        if Int(numberOfAdultsLb.text!)! <= 2
        {
            increaseAdultssBtn.isEnabled = true
            increaseAdultssBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)

        }
    }
    
    @IBAction func increaseNumberOfChildsAction(_ sender: Any) {
        
        numberOfChildsLb.text =  String(Int(numberOfChildsLb.text!)! + 1)
        if Int(numberOfChildsLb.text!)! > 0
        {
            decreaseChildsBtn.isEnabled = true
            decreaseChildsBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        }
        if Int(numberOfChildsLb.text!)! == 2
        {
            increaseChildsBtn.isEnabled = false
            increaseChildsBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)
        }
    }
    
    @IBAction func decreaseNumberOfChildsAction(_ sender: Any)
    {
        numberOfChildsLb.text =  String(Int(numberOfChildsLb.text!)! - 1)
        if Int(numberOfChildsLb.text!)! == 0
        {
            decreaseChildsBtn.isEnabled = false
            decreaseChildsBtn.setTitleColor(#colorLiteral(red: 0.7603520155, green: 0.7814491391, blue: 0.8045189977, alpha: 1), for: UIControlState.normal)
        }
        if Int(numberOfChildsLb.text!)! < 2
        {
            increaseChildsBtn.isEnabled = true
            increaseChildsBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        }
    }
    
    @IBAction func checkAvaibilityBtnAction(_ sender: Any)
    {
        if hotelSearchTF.text != ""
        {
            
            SVProgressHUD.show()
            ServiceManager().checkAvailbility(startDate: Helper.convertDateFormatter(date: startDate ?? "") , endDate: Helper.convertDateFormatter(date: endDate ?? "") , adultsNum: numberOfAdultsLb.text!, childNum: numberOfChildsLb.text!, hotelCode: selectedHotelCode) { (data, error) in
                SVProgressHUD.dismiss()
                if error == nil
                {
                    if let rooms = data?.soapBody.oTAHotelAvailRS.roomStays.roomStay.roomRates
                    {
                       let price =  rooms.roomRate?[0].rates?.rate.tpaExtensions.nightlyRate.price
                        let currency = rooms.roomRate?[0].rates?.rate.fees.fee.currencyCode
                        
                        let hotelRooms = JazHotels.hotels[0]
                        let hotelView = HotelsViewController.create()
                        hotelView.roomPrice = price
                        hotelView.roomCurrency = currency
                        hotelView.rooms = hotelRooms
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(hotelView, animated: true)

                        }
                    }
                    else
                    {
                        DispatchQueue.main.async {
                            SCLAlertView().showInfo("", subTitle: "No rooms avaiable")

                        }
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        SCLAlertView().showError((error?.localizedDescription)!, subTitle: "")

                    }
                }
                
                
            }
        }
        else
        {
            DispatchQueue.main.async {
                SCLAlertView().showError("", subTitle: "please set hotel or destination")

            }
        }
    }
    
}
