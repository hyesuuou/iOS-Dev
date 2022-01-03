//
//  TabbarVC.swift
//  BottomTabbar
//
//  Created by 김혜수 on 2022/01/03.
//

import UIKit

extension UIView {
     
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func makeRoundedWithBorder(radius: CGFloat, color: CGColor, borderWith: CGFloat = 1) {
            makeRounded(radius: radius)
            self.layer.borderWidth = borderWith
            self.layer.borderColor = color
        }
        
    var asImg: UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

class TabbarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTabbar()
    }
    
    private func initTabbar() {
        
        // tabbar border
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0.0
        self.tabBar.clipsToBounds = true
        
        // background
        let backgroundframe = CGRect(x: self.tabBar.frame.origin.x, y: self.tabBar.frame.origin.y, width: self.tabBar.frame.width, height: self.tabBar.frame.height + 50)
        let backgroundView = UIView(frame: backgroundframe)
        backgroundView.backgroundColor = UIColor.clear

        
        // rounded view
        let roundedView = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: self.tabBar.frame.height + 50))
        roundedView.backgroundColor = UIColor.white
        roundedView.makeRoundedWithBorder(radius: 24, color: UIColor.systemGray2.cgColor)
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
