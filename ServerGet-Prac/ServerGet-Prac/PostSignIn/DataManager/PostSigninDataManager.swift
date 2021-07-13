//
//  PostSigninDataManager.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/13.
//

import Alamofire
import Foundation

class PostSigninDataManager {
    
    func postSignIn(_ parameters: PostSigninRequest, viewController: PostSigninVC) {
        AF.request("\(APIConstant.BASE_URL)/user/signin",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: APIConstant.USER_HEADER)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: PostSigninResponse.self) { response in
                print(response.result)
                switch response.result {
                case .success(let response):
                    print("로그인 통신 성공~!")
                    print(response.message)
                case .failure(let error):
                    print("로그인 통신 실패 ㅠ_ㅠ")
                    print(error.errorDescription)
                
                }
            }
    }
    
}
