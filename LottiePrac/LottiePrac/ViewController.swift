//
//  ViewController.swift
//  LottiePrac
//
//  Created by 김혜수 on 2021/08/06.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "4800-weather-partly-cloudy")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.play()
        animationView.loopMode = .loop // 무한재생
        animationView.isHidden = false
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(lottieView)
        // Do any additional setup after loading the view.
    }


}

