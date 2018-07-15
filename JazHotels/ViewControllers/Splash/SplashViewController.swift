//
//  SplashViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/1/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import SCLAlertView
class SplashViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getHotels()
        readHotelImagesJSON()
    }
    
    func getHotels(){
        if let data = UserDefaults.standard.object(forKey: "Hotels") as? NSData {
            let hotels = NSKeyedUnarchiver.unarchiveObject(with: data as Data)
            JazHotels.hotels = hotels as? [JHotelDescriptiveContent]
            (JazHotels.hotelsName,JazHotels.hotelsCode) = Helper.getHotelNamesAndIds(hotelArray: JazHotels.hotels)
            self.activityIndicator .stopAnimating()
            self.setRootViewController()
            
        }
        else {
            ServiceManager().getHotels { (data, error) in
                if error != nil{
                    DispatchQueue.main.async {
                        self.activityIndicator .stopAnimating()
                        SCLAlertView.showRetryCustomAlertWithMessage(message: "Internet Connection Error") { (response) in
                            self.viewDidLoad()
                        }
                    }
                }
                else{
                    DispatchQueue.main.async {
                        JazHotels.hotels = data
                        if data != nil{
                            let dataa = NSKeyedArchiver.archivedData(withRootObject: data!)
                            UserDefaults.standard.set(dataa, forKey: "Hotels")
                            self.activityIndicator .stopAnimating()
                        }
                        self.setRootViewController()
                        
                    }
                }
            }
        }
        
    }
    func readHotelImagesJSON(){
        if let path = Bundle.main.path(forResource: "hotels-images", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, [String]>{
                    JazHotels.hotelsImages = jsonResult
                }
            } catch {
            }
        }
    }
    func setRootViewController(){
        HotelJazConstants.JAppDelegate.appdelegate.tabbarController = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil).instantiateViewController(withIdentifier: "HomeTabbar") as? UITabBarController
        HotelJazConstants.JAppDelegate.appdelegate.window?.rootViewController = HotelJazConstants.JAppDelegate.appdelegate.tabbarController
        let tabBarController = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil).instantiateViewController(withIdentifier: "HomeTabbar") as! UITabBarController
        self.navigationController?.present(tabBarController, animated: true, completion: nil)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
