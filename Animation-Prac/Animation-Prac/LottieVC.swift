//
//  LottieVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/07.
//

import UIKit
import Lottie

class LottieVC: UIViewController {
    
    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
        return animationView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(lottieView)
        
    }
    
    @IBAction func startButtonClicked(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
    }
        

}
