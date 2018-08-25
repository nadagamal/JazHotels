//
//  HotelDetailsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/13/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import ImageSlideshow
import Cosmos
import XLPagerTabStrip
class HotelDetailsViewController: SegmentedPagerTabStripViewController {
    @IBOutlet weak var slideshow: ImageSlideshow!
    var hotel:JHotelDescriptiveContent!
    
    @IBOutlet weak var hotelLocationLbl: UILabel!
    @IBOutlet weak var hotelNameLbl: UILabel!
    @IBOutlet weak var segmentioView: UIView!
    @IBOutlet weak var starView: CosmosView!
    var kingfisherSource = [InputSource]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.segmentedControlColor = #colorLiteral(red: 0.9215686275, green: 0.9254901961, blue: 0.9333333333, alpha: 1)
        
        if JazHotels.hotelsImages![hotel.hotelCode] != nil{
            let images = JazHotels.hotelsImages![hotel.hotelCode]
            for imageStr in images!{
                kingfisherSource.append(KingfisherSource(urlString:imageStr)!)
                if kingfisherSource.count>4{
                    break
                }
            }
        }
        slideshow.slideshowInterval = 10.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 30))
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        segmentedControl.removeBorders()
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5626437883)
        slideshow.pageIndicator = pageControl
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        slideshow.setImageInputs(kingfisherSource)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
        self.hotelNameLbl.text = hotel.hotelName
        if hotel.contactInfos != nil && hotel.contactInfos.contactInfo != nil && hotel.contactInfos.contactInfo.addresses != nil && hotel.contactInfos.contactInfo.addresses.address != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine.count>0{
            hotelLocationLbl.text = hotel.contactInfos.contactInfo.addresses.address.addressLine[0] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName
        }
        if hotel.affiliationInfo.awards != nil && hotel.affiliationInfo.awards.award != nil && hotel.affiliationInfo.awards.award.count>0 && hotel.affiliationInfo.awards.award[0].rating != nil{
            let stringArray = hotel.affiliationInfo.awards.award[0].rating.components(separatedBy: CharacterSet.decimalDigits.inverted)
            for item in stringArray {
                if let number = Double(item) {
                    self.starView.rating = number
                }
            }
            
        }
        else{
            self.starView.rating = 0
        }
    }
 
    func setTransparentNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        GradientNavigationBar.appearance().colors = [UIColor .clear]
    }
    @objc public static func create() -> HotelDetailsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelDetailsViewController
    }
    override func viewWillAppear(_ animated: Bool) {
       setTransparentNavigationBar()
        var list = [String]()
        if UserDefaults.standard.object(forKey: "Favourites") != nil{
            list = UserDefaults.standard.object(forKey: "Favourites") as! [String]
        }
        if list.count>0 && list .contains(hotel.hotelCode){
            updateRighBarButton(isFavourite: true)
        }else{
            updateRighBarButton(isFavourite: false)
        }

    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    func updateRighBarButton(isFavourite : Bool){
        var shareBtn:UIBarButtonItem!
        var favBtn:UIBarButtonItem!
        if isFavourite == false{
        favBtn = UIBarButtonItem(image: UIImage(named: "favHeader"), style: .done, target: self, action: #selector(favBtnAction))
        }
        else{
            favBtn = UIBarButtonItem(image: UIImage(named: "addFavH"), style: .done, target: self, action: #selector(favBtnAction))

        }
       shareBtn = UIBarButtonItem(image: UIImage(named: "share"), style: .done, target: self, action: #selector(shareBtnAction))
        self.navigationItem.rightBarButtonItems = [favBtn,shareBtn]
    }

    @objc func shareBtnAction(){
        
    }
    @objc func favBtnAction(){
        var list = [String]()
        if UserDefaults.standard.object(forKey: "Favourites") != nil{
            list = UserDefaults.standard.object(forKey: "Favourites") as! [String]
        }
        if list.count>0 && list .contains(hotel.hotelCode){
            for i in 0...list.count-1{
                list.remove(at: i)
                
            }
            updateRighBarButton(isFavourite: false)
        }
        else{
            updateRighBarButton(isFavourite: true)
        list.append(hotel.hotelCode)
        }
        UserDefaults.standard.set(list, forKey: "Favourites")
        UserDefaults.standard.synchronize()
    }
    @objc func didTap() {
    let fullScreenController = slideshow.presentFullScreenController(from:self)
    fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = HotelDetailsContactViewController.create()
        child_1.hotel = hotel
        let child_2 = HotelDetailsOverviewViewController.create()
        child_2.hotel = hotel

        let childViewControllers = [child_2, child_1]
        return childViewControllers
    }

}
