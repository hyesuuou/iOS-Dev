//
//  PopAnimator.swift
//  CustomTransitionVC
//
//  Created by 김혜수 on 2021/10/08.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.8 // how long the transition
    var presenting = true // presenting or dismissing
    var originFrame = CGRect.zero // store the original frame of image the user taps -> 나중에 full screen으로 바꿀 것

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // hold animation code
        // transitionContext -> 유일한 parameter!!
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, animations: {
            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },
        completion: { _ in
            transitionContext.completeTransition(true)
        })
        
    }
}
