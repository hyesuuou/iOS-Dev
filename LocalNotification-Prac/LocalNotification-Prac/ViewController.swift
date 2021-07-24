//
//  ViewController.swift
//  LocalNotification-Prac
//
//  Created by 김혜수 on 2021/07/14.
//


import UIKit
import UserNotifications

class ViewController: UIViewController {

    /*
     Notification Center
        - content
        - trigger
        - request
     -> Local Notification 구현 가능.
     */
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNotificationCenter.delegate = self //-> 실제로 앱이 가동되기 전에.. 되
        requestNotificationAuthorization()
        sendNotification(seconds: 10)
        
        // Do any additional setup after loading the view.
    }

    // MARK:- 사용자에게 알림 권한을 요청함. (처음에 막 허용하시겠습니까 뜨는거)
    func requestNotificationAuthorization(){
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("error\(error)")
            }
            
        }
        
        
    }
    
    // MARK:- 사용자에게 알림을 보냄
    func sendNotification(seconds: Double){
        let notificationContent = UNMutableNotificationContent()
        var date = Date()
        
        let exampleDate = DateComponents(year: 2021, month: 7, day: 17, hour: 10, minute: 11)
        date = Calendar.current.date(from: exampleDate)!
        
        // content에 들어갈 title과 body
        notificationContent.title = "이제 Keepin할 선물💝을 준비해 볼까요?"
        notificationContent.body = "오늘은 데모데이입니다."
        
        // 1. Trigger - 여기서 시간을 전달받아서 그 시간 뒤에 받기로 했음. (여기서 이제 날짜,시간으로 바꿔주면 될거같다.)
        /*
         Trigger의 세 가지 메서드
            - UNLocalNotificationTrigger(region: CLRegion, repeats: Bool)
            - UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval, repeats: Bool)
            - UNCalendarNotificationTrigger(dateMatching: DateComponents, repeats: Bool)
                -> 날짜받읅면 이거 이용하면 될듯!!@!!!!!
         */
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        
        let dateCompo = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let dateCompoTrigger = UNCalendarNotificationTrigger(dateMatching: dateCompo, repeats: false)
        
        // 2. Request , 3. Content
        // Content에 알림 title과 body 가 들어간다.
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: dateCompoTrigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
            
        }
    }
    
   

}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    // iOS 14 부터는 .alart 를 쓰면 안된다고 한다.. 그래서 이것도 찾아보기.
}
