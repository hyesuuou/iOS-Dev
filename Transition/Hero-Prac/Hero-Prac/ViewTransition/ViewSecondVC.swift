//
//  ViewSecondVC.swift
//  Hero-Prac
//
//  Created by 김혜수 on 2021/10/09.
//

import UIKit

class ViewSecondVC: UIViewController {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var blueView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        grayView.hero.id = "gray"
        blueView.hero.id = "blue"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
