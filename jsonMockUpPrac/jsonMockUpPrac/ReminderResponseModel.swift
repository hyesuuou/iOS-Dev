//
//  ReminderResponseModel.swift
//  jsonMockUpPrac
//
//  Created by 김혜수 on 2022/01/05.
//

import Foundation


// MARK: - Welcome
struct ReminderResponseModel: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let reminders: [Reminder]
}

// MARK: - Reminder
struct Reminder: Codable {
    let sendDate: String
    let isAlarm, isImportant: Bool
    let id, title, date, userIdx: String
    let year, month: String
    let daysAgo: String?
    let v: Int

    enum CodingKeys: String, CodingKey {
        case sendDate, isAlarm, isImportant
        case id = "_id"
        case title, date, userIdx, year, month, daysAgo
        case v = "__v"
    }
}
