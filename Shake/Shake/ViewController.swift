//
//  ViewController.swift
//  Shake
//
//  Created by 김혜수 on 2021/10/16.
//

import UIKit

protocol Shakeable {}

extension Shakeable where Self: UIImageView {
    func shake() {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 5
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
            layer.add(animation, forKey: "position")
        }
}

class ArtImageView: UIImageView, Shakeable {
}

class ActionButton: UIButton, Shakeable {
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: ArtImageView!
    @IBOutlet weak var shakeButton: ActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        imageView.shake()
        //shakeButton.shake()
        
    }
    
}

