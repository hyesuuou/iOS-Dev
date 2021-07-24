//
//  BaseVC.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/24.
//

import UIKit

class BaseVC: UIViewController {
    
    public static let identifier = "BaseVC"
    public static var colors : UIColor = .black
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var containerview: UIView!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.backgroundColor = BaseVC.colors
        tableview.backgroundColor = .none
////        self.addChild(embededVC())
//        let vc = embededVC()
//        vc.view.frame = self.view.bounds
//        self.addChild(vc)
//        self.view.addSubview(vc.view)
        
        // Do any additional setup after loading the view.
    }
    
    func setData(color: UIColor){
        bgView.backgroundColor = color
    }

}
