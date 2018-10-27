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
import CoreLocation
import ZAlertView

class CheckAvailabilityViewController: UIViewController , UIScrollViewDelegate {
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
    var locationManager = CLLocationManager()
    private var selectedHotelCodes:[String] = []
    fileprivate var longtitude:String = ""
    fileprivate var latitude:String = ""
    fileprivate var selectedHotelTitle:String = ""

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
       // getHotelCodes(text: "Sharm El Sheikh")
//        ServiceManager().checkAvailbility(startDate: "2018-09-06", endDate: "2018-09-09", adultsNum: "2", childNum: "1", hotelCodes:getHotelCodes(text: "Sharm El Sheikh") , roomsNum: "1") { (success, error) in
//
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(bookHotelBtnAction(notification:)), name: Notification.Name("BookHotel"), object: nil)

    }
    override func viewDidAppear(_ animated: Bool) {
        
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 700)
    }
    override func viewWillDisappear(_ animated: Bool) {

        self.navigationController?.navigationBar.isTranslucent = false
    }
    @objc func bookHotelBtnAction(notification:NSNotification){
        let hotel = notification.object as! JHotelDescriptiveContent
       self.hotelSearchTF.text = "    " + hotel.hotelName
        selectedHotelCode = hotel.hotelCode
        selectedHotelCodes = [hotel.hotelCode]
    }
    func initView()
    {
        hotelSearchTF.isSearchEnable =  true
        
        hotelSearchTF.optionArray = JazHotels.hotelsName ?? []
        hotelSearchTF.optionIds = JazHotels.hotelsCode ?? []
        hotelSearchTF.didSelect{(selectedHotel , index , id) in
            self.selectedHotelTitle = selectedHotel
            print("Selected Hotel: \(selectedHotel) \n index: \(index) \n Id: \(id)")
            self.selectedHotelCode = String(id)
            self.selectedHotelCodes = self.getHotelCodes(text: selectedHotel)
            
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        checkInDateLb.text = formatter.string(from: Date())
        checkoutDateLb.text = formatter.string(from: Date().tomorrow)
        checkInDate = Date()
        startDate = checkInDateLb.text
        endDate = checkoutDateLb.text
//        numberOfNightsLb.text = String(Helper.nightsBetweenDates(startDate: Date(), endDate: Date().tomorrow))
        numberOfNightsLb.text = "1"

    }
    override func viewWillAppear(_ animated: Bool) {
       self.navigationController?.setTransparentNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func addPromoCodeAlert(_ sender: Any) {
        
        let dialog = ZAlertView(title: "", message: "", isOkButtonLeft: true, okButtonText: "Done", cancelButtonText: "Cancel",
                                okButtonHandler: { alertView in
                                    
                                    let promoTF  = alertView.getTextFieldWithIdentifier("promo")?.text ?? ""

                                    print(promoTF)

                                    alertView.dismissAlertView()
                                    
                                    
        },
                                cancelButtonHandler: { alertView in
                                    alertView.dismissAlertView()
        })
        ZAlertView.normalTextColor = #colorLiteral(red: 0.3137254902, green: 0.0431372549, blue: 0.462745098, alpha: 1)
        dialog.addTextField("promo", placeHolder: "Add promo code")
        dialog.show()
        
    }
    @IBAction func checkInDateAction(_ sender: Any)
    {
        dateDailog.show("Select Date", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM, yyyy"
                self.checkInDateLb.text = formatter.string(from: dt)
                
//                self.checkoutDateLb.text = formatter.string(from: (dt.tomorrow))
               
                self.numberOfNightsLb.text = String(Helper.nightsBetweenDates(startDate: dt, endDate:  self.checkoutDateLb.text?.toDate(withFormat: "dd MMM, yyyy") ?? dt.tomorrow))
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
    
    @IBAction func getCurrentLocationBtnAction(_ sender: Any) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            hotelSearchTF.text = "    " + "Current Location"
        }
    }
    @IBAction func checkAvaibilityBtnAction(_ sender: Any)
    {
        if hotelSearchTF.text != "" && (isContainNewHotel(hotel: hotelSearchTF.text!) ||  hotelSearchTF.text == "    " + "Current Location")
        {
            
            if hotelSearchTF.text == "    " + "Current Location"
            {
                getHotelsUsingCurrentLocation()
            }
                
            else
            {
                getHotelsUsingHotelCode()
               
            }
            
        }
        else
        {
            if hotelSearchTF.text == ""
            {
                DispatchQueue.main.async {
                    SCLAlertView().showError("", subTitle: "please set hotel or destination.")
                    
                }
            }
            else
            {
                DispatchQueue.main.async {
                    SCLAlertView().showError("", subTitle: "your search didnot match any avaiable room stays.")
                    
                }
            }
        }
        
    }
    
    func getHotelsUsingCurrentLocation()
    {
        SVProgressHUD.show()
        ServiceManager().checkAvailbility(startDate:Helper.convertDateFormatter(date: startDate ?? ""), endDate:Helper.convertDateFormatter(date: endDate ?? "")  ,adultsNum:numberOfAdultsLb.text! , childNum:numberOfChildsLb.text!, hotelCode:"",roomsNum:numberOfRoomLb.text!,longitude:longtitude,latitude:latitude) {
            (data, error) in
            SVProgressHUD.dismiss()
            if error == nil
            {
                if let rooms = data?.soapBody.oTAHotelAvailRS
                {
                    
                    
                    
                    let roomInfoList = rooms.criteria?.criterion
                    
                    let roomStayInfo = rooms.roomStays?.roomStay?.basicPropertyInfo
                    let roomStays = rooms.roomStays?.roomStays
                    
                    //                    let currency = rooms.roomRate?[0].rates?.rate.fees.fee.currencyCode
                    
                    //                    let hotelRooms = JazHotels.hotels[0]
                    
                    if roomInfoList?.count == 0 || roomStays?.count == 0
                    {
                        DispatchQueue.main.async {
                            SCLAlertView().showInfo("", subTitle: "No rooms avaiable")
                            
                        }
                    }
                    else
                    {
                        let hotelView = HotelsViewController.create()
                        hotelView.roomInfoList = roomInfoList
                        hotelView.roomStayInfo = roomStayInfo
                        hotelView.roomStays = roomStays
                        hotelView.hotelTitle = self.hotelSearchTF.text!
                        
                        
                        //                        hotelView.roomPrice = price
                        //                    hotelView.roomCurrency = currency
                        //                    hotelView.rooms = hotelRooms
                        DispatchQueue.main.async {
                            
                            self.navigationController?.pushViewController(hotelView, animated: true)
                            
                        }
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
    func getHotelsUsingHotelCode()
    {
        ////
        SVProgressHUD.show()
        ServiceManager().checkAvailbility(startDate: Helper.convertDateFormatter(date: startDate ?? "") , endDate: Helper.convertDateFormatter(date: endDate ?? "") , adultsNum: numberOfAdultsLb.text!, childNum: numberOfChildsLb.text!, hotelCodes: selectedHotelCodes,roomsNum: numberOfRoomLb.text!) { (data, error) in
            SVProgressHUD.dismiss()
            if error == nil
            {
                if let rooms = data?.soapBody.oTAHotelAvailRS
                {
                    
                    
                    
                    let roomInfoList = rooms.criteria?.criterion
                    
                    let roomStayInfo = rooms.roomStays?.roomStay?.basicPropertyInfo
                    var roomStays = rooms.roomStays?.roomStays
                    
                    if self.selectedHotelCodes.count == 1{
                        roomStays?.append((rooms.roomStays?.roomStay)!)
                    }
                    
                    //                    let currency = rooms.roomRate?[0].rates?.rate.fees.fee.currencyCode
                    
                    //                    let hotelRooms = JazHotels.hotels[0]
                    
                    if roomStays?.count == 0 || roomStays == nil
                    {
                        DispatchQueue.main.async {
                            SCLAlertView().showInfo("", subTitle: "No rooms avaiable")
                            
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async {
                        let hotelView = HotelsViewController.create()
                        hotelView.roomInfoList = roomInfoList
                        hotelView.roomStayInfo = roomStayInfo
                        hotelView.roomStays = roomStays
                        hotelView.hotelTitle = self.selectedHotelTitle
                        hotelView.checkInDate = Helper.convertDateFormatter(date: self.startDate ?? "")
                        hotelView.checkOutDate = Helper.convertDateFormatter(date: self.endDate ?? "")
                        hotelView.adultsNum = self.numberOfAdultsLb.text
                        hotelView.childNum = self.numberOfChildsLb.text
                        hotelView.roomNum = self.numberOfRoomLb.text
                        hotelView.chainCode = "16401"
                            self.navigationController?.pushViewController(hotelView, animated: true)

                        }
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
    func isContainNewHotel(hotel:String) -> Bool
    {
        for (_,item) in hotelSearchTF.optionArray.enumerated()
        {
            if hotel == item
            {
                return true
            }
        }
        return false
    }
    
    //MARK:- Get Hotel Codes by city name or hotel name
    func getHotelCodes(text:String) -> [String] {
        var codes = [String]()
        for hotel in JazHotels.hotels {
            if text == hotel.hotelName || text == hotel.contactInfos.contactInfo.addresses.address.cityName{
                codes.append(hotel.hotelCode)
            }
        }
        return codes
    }

    
}

extension CheckAvailabilityViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        self.longtitude  =  String(format: "%f", userLocation.coordinate.longitude)
        self.latitude  =  String(format: "%f", userLocation.coordinate.latitude)

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}
