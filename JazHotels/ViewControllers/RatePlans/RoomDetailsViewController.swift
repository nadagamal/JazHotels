//
//  RoomDetailsViewController.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 8/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Kingfisher
class RoomDetailsViewController: UIViewController {

    @IBOutlet weak var txtViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var roomTitleLbl: UILabel!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgView: UIImageView!
    var room:JCRoomType!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTxtView.text = room.roomDescription.text.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        self.roomTitleLbl.text = room.roomDescription.name
        let imageURL = URL(string: (room.roomDescription!.image))
        imgView.kf.indicatorType = .activity
        imgView.kf.setImage(with: imageURL, placeholder: UIImage(named: "jazLauncherLogo"), options: [.transition(ImageTransition.fade(0.7))], progressBlock: nil, completionHandler: nil)
        
    }
    @objc public static func create() -> RoomDetailsViewController {
        
        return UIStoryboard(name: HotelJazConstants.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! RoomDetailsViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
