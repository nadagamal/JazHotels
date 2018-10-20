//
//  HotelDetailsOverviewViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 7/14/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class HotelDetailsOverviewViewController: UIViewController,IndicatorInfoProvider{
    var itemInfo: IndicatorInfo = "Overview"
    var hotel:JHotelDescriptiveContent!
    @IBOutlet weak var overviewContent: UITextView!
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - IndicatorInfoProvider
    
    @IBAction func bookAction(_ sender: Any) {
      //  navigationController?.show(BookHotelViewController.create(), sender: sender)
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "BookHotel"), object: hotel)
    self.tabBarController?.selectedIndex = 2
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
}
    @objc public static func create() -> HotelDetailsOverviewViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HotelDetailsOverviewViewController
    }
}
