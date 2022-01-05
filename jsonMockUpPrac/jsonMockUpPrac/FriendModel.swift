//
//  FriendModel.swift
//  jsonMockUpPrac
//
//  Created by 김혜수 on 2022/01/05.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct FriendResponseModel: Codable {
    let status: Int
    let message: String
    let data: ReminderClass
}

// MARK: - DataClass
struct ReminderClass: Codable {
    let friends: [Friend]
}

// MARK: - Friend
struct Friend: Codable {
    let id, name, memo: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, memo
    }
}
