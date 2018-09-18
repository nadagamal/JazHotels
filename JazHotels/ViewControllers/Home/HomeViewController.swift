//
//  ViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 6/20/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
class HomeViewController: UIViewController {

    let icon: UIButton = UIButton()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkAvailbilityAction(_ sender: Any) {
        if self.tabBarController?.tabBar.subviews.last is UIButton{
            var button = self.view.subviews.last as! UIButton
            button.setBackgroundImage(#imageLiteral(resourceName: "checkAvailableNav"), for: .normal)
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabBarController = appDelegate.window?.rootViewController as! UITabBarController
        tabBarController.selectedIndex = 2;
    }
    @objc public static func create() -> HomeViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "HotelCollectionViewCell", for: indexPath) as! HotelCollectionViewCell
        let  hotel = JazHotels.hotels[indexPath.item]
        cell.nameLbl.text = hotel.hotelName
        if JazHotels.hotelsImages![hotel.hotelCode] != nil{
        let imageURL = URL(string: JazHotels.hotelsImages![hotel.hotelCode]![0])
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        }
        if hotel.contactInfos != nil && hotel.contactInfos.contactInfo != nil && hotel.contactInfos.contactInfo.addresses != nil && hotel.contactInfos.contactInfo.addresses.address != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine != nil && hotel.contactInfos.contactInfo.addresses.address.addressLine.count>0{
        cell.regionLbl.text = hotel.contactInfos.contactInfo.addresses.address.addressLine[0] + "  -  " + hotel.contactInfos.contactInfo.addresses.address.cityName
        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JazHotels.hotels.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hotelDetailsVC = UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: nil).instantiateViewController(withIdentifier: "HotelDetailsViewController") as! HotelDetailsViewController
        let  hotel = JazHotels.hotels[indexPath.item]
        hotelDetailsVC.hotel = hotel
        self.navigationController?.show(hotelDetailsVC, sender: nil)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(UIScreen.main.bounds.width/2)-30,height:181)
    }

}

