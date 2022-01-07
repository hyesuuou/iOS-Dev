//
//  CardPackViewController.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/08.
//

import UIKit

class CardPackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addCardButtonDidTap(_ sender: Any) {
        let modal = CardPackAddModalViewController()
        modal.modalPresentationStyle = .overFullScreen
        self.present(modal, animated: false, completion: nil)
    }

}
