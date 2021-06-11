//
//  MenuFoldVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/08.
//

import UIKit

class MenuFoldVC: UIViewController {

    @IBOutlet weak var sampleView: UIView!
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    var isOpened : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func openButtonClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.5){
            if self.isOpened {
                self.close()
            }
            else{
                self.open()
            }
        }
        
    }
    
    func open(){
        print("open")
        menuHeightConstraint.constant = 200
        sampleView.transform = CGAffineTransform(rotationAngle: .pi)
        self.view.layoutIfNeeded()
        isOpened = true
    }
    func close(){
        print("close")
        menuHeightConstraint.constant = 80
        sampleView.transform = CGAffineTransform(rotationAngle: 0)
        self.view.layoutIfNeeded()
        isOpened = false
    }

}
