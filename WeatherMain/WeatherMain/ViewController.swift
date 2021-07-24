//
//  ViewController.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

    var cityList : [String] = ["마포구", "용산구", "수원시"]
    var color : [UIColor] = [UIColor.red, UIColor.green, UIColor.purple]
    
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    
    }
    
    func setUI(){
        for index in 0..<cityList.count {
            let subview = UIView()
            subview.frame = UIScreen.main.bounds
            subview.backgroundColor = color[index]
            subview.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollview.addSubview(subview)
        }
        
        scrollview.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(cityList.count), height: UIScreen.main.bounds.height
        )
        
        scrollview.alwaysBounceVertical = false
        
    }

}

