
import UIKit

class TabBarVC: UITabBarController {
    @IBOutlet weak var TabBar: UITabBar!
    var button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addCenterButtonWithImage(buttonImage: UIImage(named:"home")!, highlightImage: UIImage(named:"home"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2
        {
        }
    }
    func addCenterButtonWithImage(buttonImage: UIImage, highlightImage:UIImage?){
        let frame = CGRect(x: 0.0, y: 0.0, width: buttonImage.size.width, height: buttonImage.size.height)
        button = UIButton(frame: frame)
        button.setBackgroundImage(buttonImage, for:UIControlState.normal)
        button.setBackgroundImage(highlightImage, for: UIControlState.highlighted)
        let heightDifference:CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        if heightDifference < 0 {
                
        button.center = self.tabBar.center;
        }
        else
                
        {

         var center:CGPoint = self.tabBar.center;
                    
         center.y = center.y - heightDifference/2.0;
                    
         button.center = center;
         }
            
        button.addTarget(self, action: Selector(("changeTabToMiddleTab:")), for: UIControlEvents.touchUpInside)
            
        self.view.addSubview(button)
            
    }
    func changeTabToMiddleTab(sender:UIButton){

    }
}
