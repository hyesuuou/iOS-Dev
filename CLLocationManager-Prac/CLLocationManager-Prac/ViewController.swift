//
//  ViewController.swift
//  CLLocationManager-Prac
//
//  Created by 김혜수 on 2021/08/01.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    var latitude: Double = 0.0 // 위도
    var longtitude: Double = 0.0 // 경도
    
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LocationManager 인스턴스 생성
        locationManager = CLLocationManager()
        
        // 델리게이트 생성
        locationManager.delegate = self
        
        // 포그라운드 상태에서 위치추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        
        // 배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
       
        
        
    }
    
    

    @IBAction func buttonClicked(_ sender: Any) {
        // 위치 업데이트
        locationManager.startUpdatingLocation()
        
        // 위도와 경도 가져오기
        let location = locationManager.location?.coordinate
        // 위도와 경도 저장
        latitude = location?.latitude ?? 5
        longtitude = location?.longitude ?? 5
        
        textLabel.text = "위도: \(latitude), 경도: \(longtitude)"
    }
    
}

