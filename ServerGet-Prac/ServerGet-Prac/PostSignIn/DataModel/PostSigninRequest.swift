//
//  PostSigninRequest.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/13.
//

import Foundation

// MARK: - PostSigninRequest
struct PostSigninRequest: Codable {
    let email, password: String
}

