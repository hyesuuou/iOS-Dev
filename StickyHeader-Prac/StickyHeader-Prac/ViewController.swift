//
//  ViewController.swift
//  StickyHeader-Prac
//
//  Created by 김혜수 on 2021/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var topviewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.delegate = self
        
    }


}

extension ViewController: UIScrollViewDelegate {
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollview.contentOffset.y) // 위로 올라가면 +
        if (scrollview.contentOffset.y > 0){
            topview.frame.origin.x = 0
            topviewHeight.constant = max(abs(scrollview.contentOffset.y), 128)
        }
    }
}

