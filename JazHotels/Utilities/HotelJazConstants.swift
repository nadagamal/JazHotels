import UIKit


class HotelJazConstants: NSObject {

    struct SocialPath{
        static let kSocialAuthenticationPathGoogle: String = "GOOGLE"
    }

    struct Notifications {
        static let userProfileData = "userProfileData"

    }
    struct userDefault {
        static let userData = "userData"
    }
    
    struct StoryBoard
    {
        static let mainSB = "Main"
        static let authSB = "Authentication"


    }
    
    struct JAppDelegate
    {
        static let appdelegate = UIApplication.shared.delegate as! AppDelegate
        
    }
   
}
