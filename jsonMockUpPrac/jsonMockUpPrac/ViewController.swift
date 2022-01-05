//
//  ViewController.swift
//  jsonMockUpPrac
//
//  Created by 김혜수 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {
    
    var list: [FriendResponseModel] = []
    var reminder: [ReminderResponseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("이전", list)
        General.decodeJson(name: "Friend", list: &list)
        print("이후", list)
        General.decodeJson(name: "reminder_list", list: &reminder)
        print(reminder)
        print(reminder[0].data.reminders[1].title)
    }


}

