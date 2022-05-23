//
//  ViewController.swift
//  Alamofire-Lab
//
//  Created by 김혜수 on 2022/05/11.
//

import UIKit

import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImages()
    }
    
    private func getImages() {
        AF.request("https://picsum.photos/v2/list")
            .response { response in
                print(response)
            }
        
    }
    
}
