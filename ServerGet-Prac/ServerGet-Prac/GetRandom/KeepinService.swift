//
//  KeepinService.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//


import Alamofire
import Foundation

// 실제 통신
class KeepinService {
    
    static let shared = KeepinService()
        
        func getRandom(completion: @escaping (NetworkResult<Any>) -> Void){
            
            // 요청서 작성
            let dataRequest = AF.request(APIConstant.BASE_URL + "/random",
                                         method: .get,
                                         encoding: JSONEncoding.default,
                                         headers: APIConstant.HEADER)
            
            
            dataRequest.responseData { dataResponse in
                
                switch dataResponse.result {
                
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.value else { return }
                    let networkResult = self.judgeStatus(by: statusCode, value)
                    completion(networkResult)
                    print("dyrl")
                    
                case .failure:
                    completion(.pathErr)
                }
                
            }
            
            
        }
        
        private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
            
            let decoder = JSONDecoder()
            
            // Decode하는 중... -> 실해파면 pathErr
            guard let decodeData = try? decoder.decode(RandomDataModel.self, from: data) else { return .pathErr }
            //print(decodeData)
            
            switch statusCode {
            // 200 : 성공한 경우 (isValidData로 데이터 넘겨줌)
            case 200:
                return .success(decodeData.data)
            // 400 : 요청이 잘못되었다는 경우 .pathErr 리턴
            case 400:
                return .pathErr
            // 500 : 서버 에러
            case 500:
                return .serverErr
            // 기타 : 네트워크 에러
            default:
                return .networkFail
            }
        }
    
    
}
