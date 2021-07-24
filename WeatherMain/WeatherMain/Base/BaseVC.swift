//
//  BaseVC.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/24.
//

import UIKit

class BaseVC: UIViewController {
    
    public static let identifier = "BaseVC"

    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setData(color: UIColor){
        bgView.backgroundColor = color
    }

}
