//
//  FirstVC.swift
//  Hero-Prac
//
//  Created by 김혜수 on 2021/10/08.
//

import UIKit
import Hero

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .slide(direction: .left))
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
