//
//  DelegateVC.swift
//  Delegate-Prac
//
//  Created by 김혜수 on 2021/09/04.
//

import UIKit

class DelegateVC: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    var delegate: SampleProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func sendButtonClicked(_ sender: Any) {
        if let text = textfield.text {
            delegate?.dataSend(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
