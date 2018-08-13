//
//  HotelOnMapViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/5/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import MapKit
import HCMapInfoView
class HotelOnMapViewController: UIViewController {
   
    
    @IBOutlet weak var map: MKMapView!
    fileprivate var annotation: MKAnnotation!
    var roomStays: [JCRoomStay] = []
    var hotelsLocation:[Location] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelListCoordinates(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)

    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHotelListCoordinates(notification:)), name: Notification.Name("getHotelListInfo"), object: nil)

        self.navigationController?.navigationBar.isHidden = false

    }
    @objc public static func create() -> HotelOnMapViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelOnMapViewController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updateHotelListCoordinates(notification: Notification){
        
        self.roomStays = (notification.userInfo!["roomStays"] as? [JCRoomStay])!
        let hotelName = notification.userInfo!["hotelTitle"] as? String

        for (_,hotel) in (roomStays.enumerated())
        {
            if let location =  JazHotels.hotelsCoords![(hotel.basicPropertyInfo.hotelCode)!]
            {

                hotelsLocation.append(Location(latitude: Double(location[0] )! , longtitude: Double(location[1] )!))
                
            }
        }
        
        for (index,item) in hotelsLocation.enumerated()
        {
        
            map.addAnnotation(HotelMapDetailsView(hotelName:hotelName ?? "", hotelLocation:roomStays[index].basicPropertyInfo.hotelName, coordinate:CLLocationCoordinate2D(latitude: item.latitude, longitude:item.longtitude), image:#imageLiteral(resourceName: "Splash")))

        }
        
    }
}
extension HotelOnMapViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let view = annotation as? HotelMapDetailsView
        {
            return HCAnnotationView.hcCreatePin(forMap: mapView, forAnnotation: annotation, withPinImage:#imageLiteral(resourceName: "locationdetails"), withReuseIdentifier:"location", withClass: MapInfoHotelView.self, mapInfoViewName: "MapInfoHotelView", showInfoViewHandler: {infoView in
                if let redView = infoView as? MapInfoHotelView
                {
                    redView.update(withHotel: view)
                }
            })
        }
        
        // Create classic pin which cant show custom info view, it will show native callout
        return HCPinAnnotationView.hcCreateDefaultPin(forMap: mapView, forAnnotation: annotation, withReuseIdentifier: "BasicMapPin")

        
    }
}
