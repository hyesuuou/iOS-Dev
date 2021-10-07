//
//  AnimationTransition.swift
//  Custom-TransitionVC-Animation
//
//  Created by 김혜수 on 2021/10/08.
//

import Foundation
import UIKit

class AnimationTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    
    var originPoint: CGPoint?
    var originFrame: CGRect?
    
    func setPoint(point: CGPoint?) {
        self.originPoint = point
    }
    
    func setFrame(frame: CGRect?) {
        self.originFrame = frame
    }
    
    // MARK: - 애니메이션의 동작시간
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    // MARK: - 애니메이션의 효과를 정의
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        /*
         transitionContext.containerView => 뷰를 담을 수 있는 전체 틀
         */
        let containerView = transitionContext.containerView
        
        /*
         
         transitionContext.view를 통해 보여지거나, 사라질 뷰를 가져옴
         .to => 앞으로 보여질 뷰 (나타날 뷰)
         .from => 앞으로 가려질 뷰 (사라질 뷰)
         
         */
        /// 다음 보여질 뷰를 참조 (그렇기 때문에 앞으로 나타날 뷰 .to 를 선택)
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        /// 보여질 뷰의 위치 잡기 (cell의 frame)
        toView.frame = originFrame!
        
        // MARK: CGAffineTransform을 이용한 효과
        toView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        /// addSubview를 통해 화면이 나타나도록 함
        containerView.addSubview(toView)
        
        /// hierarchy on top
        containerView.bringSubviewToFront(toView)
        
        toView.layer.masksToBounds = true
        toView.layer.cornerRadius = 20
        toView.alpha = 0
        
        // MARK: 애니메이션 적용
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut, animations: {
                        toView.transform = .identity
                        toView.alpha = 1
                       }) { _ in
            toView.translatesAutoresizingMaskIntoConstraints = false
            toView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            toView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            toView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            
            UIView.animate(withDuration: 1) {
                containerView.layoutIfNeeded()
            }
        }
        transitionContext.completeTransition(true)
    }
}
