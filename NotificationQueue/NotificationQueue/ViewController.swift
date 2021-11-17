//
//  ViewController.swift
//  NotificationQueue
//
//  Created by 김혜수 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        notificationQueueTest()
        // Do any additional setup after loading the view.
    }
    
    func notificationQueueTest() {
        let center = NotificationCenter.default
        let queue = NotificationQueue.default

        center.addObserver(self, selector: #selector(self.aObserver), name: Notification.Name("a"), object: nil)
        center.addObserver(self, selector: #selector(self.bObserver), name: NSNotification.Name("b"), object: nil)
        
        print("a enqueue, b enqueue 전")
        queue.enqueue(Notification(name: Notification.Name("a")), postingStyle: .whenIdle)
        print("a enqueue 후, b enqueue 전")
        queue.enqueue(Notification(name: Notification.Name("b")), postingStyle: .now)
        print("a enqueue 후, b enqueue 후")
    }
    
    @objc
    func aObserver() {
        print("😊 aObserver 실행")
    }
    
    @objc
    func bObserver() {
        print("🍎 bObserver 실행")
    }


}

