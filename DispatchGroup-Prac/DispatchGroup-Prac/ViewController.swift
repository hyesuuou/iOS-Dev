//
//  ViewController.swift
//  DispatchGroup-Prac
//
//  Created by 김혜수 on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationGroup = DispatchGroup()
        
        // enter
        animationGroup.enter()
        UIView.animate(withDuration: 5){
            self.view1.backgroundColor = .blue
        } completion: { _ in
            // leave
            animationGroup.leave()
        }
        
        // enter
        animationGroup.enter()
        UIView.animate(withDuration: 1.5){
            self.view2.backgroundColor = .green
        } completion: { _ in
            //leave
            animationGroup.leave()
        }
        
        // notify
        animationGroup.notify(queue: .main){
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: nextVC.identifier) as? nextVC else { return }
            
            self.present(vc, animated: true, completion: nil)
        }
        
    }


}

