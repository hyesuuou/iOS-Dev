//
//  AnimationVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/08.
//

import UIKit

class AnimationVC: UIViewController {

    @IBOutlet weak var sampleImageView: UIImageView!
    @IBOutlet weak var sampleTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func startButtonClicked(_ sender: Any) {
        self.sampleTopConstraint.constant = 400
//        UIView.animate(withDuration: 3) {
//            print("애니메이션1")
//        } completion: { _ in
//            UIView.animate(withDuration: 3) {
//                print("애니메이션2")
//            } completion: { _ in
//                UIView.animate(withDuration: 3) {
//                    print("애니메이션3")
//                } completion: { _ in
//                    UIView.animate(withDuration: 3) {
//                        print("애니메이션4")
//                    }
//                }
//            }
//        }
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4){
                print("애니메이션1")
            }
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4){
                print("애니메이션2")
            }
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4){
                print("애니메이션3")
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4){
                print("애니메이션4")
            }
        }
    
    }
    
}
