//
//  SecondVC.swift
//  Delegate-Prac
//
//  Created by 김혜수 on 2021/09/04.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondNextVC") as? SecondNextVC else { return }
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
    }
}

/// MessageProtocol 채틱 -> 그안의 메서드들을 구현해줘야 한다.
extension SecondVC: MessageProtocol {
    func printMessage(msg: String) {
        print(msg)
    }
}
