//
//  ViewController.swift
//  Custom-TransitionVC-Animation
//
//  Created by 김혜수 on 2021/10/08.
//

import UIKit

class ViewController: UIViewController {

    var cellOriginPoint: CGPoint?
    var cellOriginFrame: CGRect?
    var transition: AnimationTransition?
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        self.transitioningDelegate = self
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        print("누름")
        ///좌표계 전환 nil일시 윈도우 좌표계
        cellOriginPoint = cell.superview?.convert(cell.center, to: nil)
        cellOriginFrame = cell.superview?.convert(cell.frame, to: nil)
        transition = AnimationTransition()
        transition?.setPoint(point: cellOriginPoint)
        transition?.setFrame(frame: cellOriginFrame)
        
    }
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    // MARK: - Present할 때 실행되는 애니메이션
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    // MARK: - Dismiss할 때 실행되는 애니메이션
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DisMissAnim()
    }
    
    // MARK: - 나타나거나 사라질 때의 작업
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}

extension ViewController: UINavigationControllerDelegate {
    
    // MARK: -  push, pop 애니메이션
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}

