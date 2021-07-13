//
//  SigninDataModel.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SigninDataModel: Codable {
    let status: Int
    let message: String
    let data: Data
}

// MARK: - DataClass
struct Data: Codable {
    let jwt, refreshToken, name: String
}
