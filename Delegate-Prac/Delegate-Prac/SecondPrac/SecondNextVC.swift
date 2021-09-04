//
//  SecondNextVC.swift
//  Delegate-Prac
//
//  Created by 김혜수 on 2021/09/04.
//

import UIKit

class SecondNextVC: UIViewController {
    
    var delegate: MessageProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

    @IBAction func printButtonClicked(_ sender: Any) {
        delegate?.printMessage(msg: "이 메시지 출력하기")
    }
}
