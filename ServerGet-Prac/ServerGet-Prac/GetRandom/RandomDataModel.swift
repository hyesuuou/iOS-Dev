//
//  RandomDataModel.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//

import Foundation

import Foundation

// MARK: - Welcome
struct RandomDataModel: Codable {
    let status: Int
    let message: String
    let data: Random
}

// MARK: - DataClass
struct Random: Codable {
    let id, title, photo: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, photo
    }
}
