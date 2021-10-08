//
//  ViewFirstVC.swift
//  Hero-Prac
//
//  Created by 김혜수 on 2021/10/09.
//

import UIKit
import Hero

class ViewFirstVC: UIViewController {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        grayView.hero.id = "gray"
        blueView.hero.id = "blue"
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewSecondVC") as? ViewSecondVC else { return }
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
