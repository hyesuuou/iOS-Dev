//
//  PostSigninResponse.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/13.
//

import Foundation

// MARK: - PostSigninResponse
struct PostSigninResponse: Codable {
    let status: Int
    let message: String
    let data: PostSigninData?
    
    init(from decoder : Decoder) throws
        {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = (try? values.decode(Int.self, forKey: .status)) ?? 404
            message = (try? values.decode(String.self, forKey: .message)) ?? ""
            data = (try? values.decode(PostSigninData.self, forKey: .data)) ?? nil
        }
}

// MARK: - DataClass
struct PostSigninData: Codable {
    let jwt, refreshToken, name: String
}
