//
//  APIConstant.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//


import Foundation
import Alamofire

struct APIConstant {
    static let BASE_URL = "http://keepin-alb-1248062252.ap-northeast-2.elb.amazonaws.com"
    static var USER_HEADER : HTTPHeaders = ["Content-Type": "application/json"]
    static var HEADER : HTTPHeaders = ["Content-Type": "application/json", "Jwt" : Token.jwt]
}

