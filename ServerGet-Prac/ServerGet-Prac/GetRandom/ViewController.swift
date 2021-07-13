//
//  ViewController.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        KeepinService.shared.getRandom { (response) in
                    switch(response)
                    {
                    case .success(let data):
                        print(data)
                        let string = data as? Random
                        self.memoLabel.text = string?.title
                    case .requestErr(let message) :
                        print("requestERR",message)
                    case .pathErr :
                        print("여기pathERR")
                    case .serverErr:
                        print("serverERR")
                    case .networkFail:
                        print("networkFail")
                    }
                }
        // Do any additional setup after loading the view.
    }
    
    

}

