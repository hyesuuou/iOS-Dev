//
//  ViewController.swift
//  Snapkit-Lab
//
//  Created by 김혜수 on 2022/04/13.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    let sampleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    func configureLayout() {
        sampleView.backgroundColor = .systemPurple
        view.addSubview(sampleView)
        
        
        sampleView.snp.makeConstraints { make in
            make.width.equalTo(self.view)
            make.height.equalTo(70)
            make.top.equalTo(self.view).offset(30)
        }
        
    }


}

