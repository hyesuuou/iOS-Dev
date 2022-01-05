//
//  File.swift
//  jsonMockUpPrac
//
//  Created by 김혜수 on 2022/01/05.
//

import Foundation

struct General {
    
    static func decodeJson<T: Codable>(name: String, list: inout [T]) {
        let jsonDecoder = JSONDecoder()
        
        guard let fileLocation = Bundle.main.url(forResource: name, withExtension: "json") else { return print("zz") }
        do {
            _ = try Data(contentsOf: fileLocation)
            
        } catch {
            print(error)
        }
        
        let order = try? jsonDecoder.decode(T.self, from: Data(contentsOf: fileLocation))
        list.append(contentsOf: [order!])
        
        
    }
}
