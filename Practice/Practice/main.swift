//
//  main.swift
//  Practice
//
//  Created by 김혜수 on 2023/09/29.
//

import Foundation

struct Person {
    let id: Int
    let name: String
}

let jsonData = """
{
    "id": 100,
    "name": "김혜수"
}
"""

let data = jsonData.data(using: .utf8)!
let dic = try JSONSerialization.jsonObject(with: data) as! [String: Any]
//rint(dic)

let json = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
print(json)

