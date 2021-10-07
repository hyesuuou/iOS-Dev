//
//  DisMissAnim.swift
//  Custom-TransitionVC-Animation
//
//  Created by 김혜수 on 2021/10/08.
//

import Foundation
import UIKit

class DisMissAnim: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 사라지는 뷰
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        UIView.animate(withDuration: 0.2, animations: {
            fromView.alpha = 0
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
}
