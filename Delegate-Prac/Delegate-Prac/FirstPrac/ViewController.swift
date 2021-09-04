//
//  ViewController.swift
//  Delegate-Prac
//
//  Created by 김혜수 on 2021/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DelegateVC") as? DelegateVC else {
            return
        }
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: SampleProtocol {
    func dataSend(data: String) {
        dataLabel.text = data
    }
    
    
}
