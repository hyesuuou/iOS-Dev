//
//  DataManager.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//

import Foundation
import Alamofire

class DataManager {

    func reqNew(_ viewController: GetRandomSquaredVC){
        AF.request("\(APIConstant.BASE_URL)/random", method: .get, parameters: nil, headers: APIConstant.HEADER)
                .validate()
                .responseDecodable(of: DataResponse.self){ response in
                    switch response.result {
                    case .success(let response):
                        let result = response.data.title
                        let id = response.data.id
                        print(id)
                        viewController.memoLabel.text = result
                    
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }

}
