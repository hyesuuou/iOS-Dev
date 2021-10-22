//
//  CustomAcitivity.swift
//  ShareSNS
//
//  Created by 김혜수 on 2021/10/22.
//

import UIKit


protocol CustomActivityDelegate: NSObjectProtocol {
    func performActionCompletion(activity: CustomActivity)
}

class CustomActivity: UIActivity {
    
    weak var delegate: CustomActivityDelegate?
    
    override var activityType: UIActivity.ActivityType? { return .addToReadingList }
    override class var activityCategory: UIActivity.Category { return .action }
    override var activityTitle: String? { return "Open in Safari" }
    override var activityImage: UIImage? { return UIImage(named: "imgKeepin") }
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    override func prepare(withActivityItems activityItems: [Any]) {
        
    }
    override func perform() {
        self.delegate?.performActionCompletion(activity: self)
        activityDidFinish(true)
    }
}
