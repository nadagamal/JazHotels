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

        // Do any additional setup after loading the view.
        if let appInfo = UserDefaults.standard.object(forKey: "HotelDescriptiveContents") {
            self.activityIndicator .stopAnimating()
            let decodedAppInfo = NSKeyedUnarchiver.unarchiveObject(with: appInfo as! Data) as! JHotelDescriptiveContent
            JazHotels.hotels = decodedAppInfo
        } else {
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
                        self.activityIndicator .stopAnimating()
                    }
                }
            }
        }
        
        

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
