//
//  DelegateSecondVC.swift
//  Delegate-Prac
//
//  Created by 김혜수 on 2021/09/04.
//

import UIKit

class DelegateSecondVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
    }
}

extension DelegateSecondVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label.text = textfield.text!
        return true
    }
}
