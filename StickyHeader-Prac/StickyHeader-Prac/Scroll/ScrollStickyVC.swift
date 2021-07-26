//
//  ScrollStickyVC.swift
//  StickyHeader-Prac
//
//  Created by 김혜수 on 2021/07/26.
//

import UIKit

class ScrollStickyVC: UIViewController {

    
    @IBOutlet weak var topviewHieght: NSLayoutConstraint!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var scrollviewContainView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.topviewHieght.constant = 30
        UIView.animate(withDuration: 3){
            self.view.layoutIfNeeded()
        }
        
    }
    
}

extension ScrollStickyVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //print(scrollview.frame.height)
        print(scrollview.contentOffset.y)
        if scrollview.contentOffset.y > 0 {
            //self.topviewHieght.constant -= scrollview.frame.height
            self.topviewHieght.constant = 100
            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
            }
        }
        else {
            print("내릴때")
            topviewHieght.constant = 300
            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
            }
        }
        
        
    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        //print(scrollview.frame.height)
//        if scrollview.contentOffset.y > 0 {
//            self.topviewHieght.constant = 70
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//        }
//    }
}
