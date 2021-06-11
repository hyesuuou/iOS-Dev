//
//  ActivityIndicatorVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/07.
//

import UIKit

class ActivityIndicatorVC: UIViewController {
    
    // lazy : 해당 클래스가 시작될 때 변수가 초기화되는 것이 아니라, 실제로 해당 변수가 사용될 때 초기값이 계산되는 형태
    // lazy를 사용하면 클로저 내부에서 self 형태로 접근할 수 있다.
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView() // 나중에 반환될 값
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        activityIndicator.center = self.view.center // self.view.center: 현재 뷰컨 뷰의 중심
        
        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true   // 해당 Indicator가 숨겨지면 멈출지
        activityIndicator.style = .medium
        
        activityIndicator.stopAnimating()   // 최초에 해당 Indicator가 선언되었을 때 멈춘 상태로 있기 위해서
        return activityIndicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndicator)

        
    }
    

    @IBAction func startButtonClicked(_ sender: Any) {
        activityIndicator.startAnimating()
    }
    
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        activityIndicator.stopAnimating()
    }
    
}
