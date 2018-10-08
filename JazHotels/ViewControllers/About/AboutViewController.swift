//
//  AboutViewController.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/4/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkedInAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.linkedin.com/company/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func pintrestAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.pinterest.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func twitterAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://twitter.com/Jaz_Hotels?lang=en")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func youtubeAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.youtube.com/channel/UCqSBDQ8ceZN4JCqy756JIgA?view_as=subscriber")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func facebookAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.facebook.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func instagramAction(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.instagram.com/jazhotelgroup/")!, options: [:]) { (handler) in
                
            }
        } else {
            // Fallback on earlier versions
        }
        
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
