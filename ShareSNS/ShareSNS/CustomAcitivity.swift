//
//  CustomAcitivity.swift
//  ShareSNS
//
//  Created by 김혜수 on 2021/10/22.
//

import UIKit

class CustomAcitivity: UIActivity {
    override var activityType: UIActivity.ActivityType? { return .addToReadingList }
    override class var activityCategory: UIActivity.Category { return .share }
    
}
