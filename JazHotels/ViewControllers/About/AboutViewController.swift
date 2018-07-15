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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkedInAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com/company/18467184/")!, options: [:]) { (handler) in
            
        }
    }
    @IBAction func pintrestAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.pinterest.com/jazcollection/")!, options: [:]) { (handler) in
            
        }
    }
    @IBAction func twitterAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://twitter.com/Jaz_Hotels")!, options: [:]) { (handler) in
            
        }
    }
    @IBAction func youtubeAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/user/JazHotelsandResorts")!, options: [:]) { (handler) in
            
        }
    }
    @IBAction func facebookAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com/jazcollectionegypt/")!, options: [:]) { (handler) in
            
        }
    }
    
    @IBAction func instagramAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com/jazcollectionegypt/")!, options: [:]) { (handler) in
            
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
