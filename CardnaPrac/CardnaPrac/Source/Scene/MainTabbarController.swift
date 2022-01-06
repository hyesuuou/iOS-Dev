//
//  MainTabbarController.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import UIKit



class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabbar()
        // Do any additional setup after loading the view.
    }
    
    
    
    private func initTabbar() {
        
        // tabbar border
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0.0
        self.tabBar.clipsToBounds = true
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1000)
        
        // background
        let backgroundframe = CGRect(x: self.tabBar.frame.origin.x, y: self.tabBar.frame.origin.y, width: self.tabBar.frame.width, height: self.tabBar.frame.height + 50)
        let backgroundView = UIView(frame: backgroundframe)
        backgroundView.backgroundColor = UIColor.clear
        
        // rounded view
        let roundedView = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: self.tabBar.frame.height + 50))
        roundedView.backgroundColor = UIColor.darkGray
        roundedView.makeRoundedWithBorder(radius: 20, color: UIColor.darkGray.cgColor)
        backgroundView.addSubview(roundedView)
        
        // set tabbar background image
        self.tabBar.backgroundImage = backgroundView.asImg
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundImage = backgroundView.asImg
            tabBarAppearance.backgroundColor = UIColor.clear
            tabBarAppearance.backgroundEffect = .none
            self.tabBar.standardAppearance = tabBarAppearance
            
            if #available(iOS 15.0, *) {
                self.tabBar.scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
}
