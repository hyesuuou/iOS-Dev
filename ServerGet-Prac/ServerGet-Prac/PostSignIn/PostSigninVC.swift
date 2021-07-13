//
//  PostSigninVC.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/13.
//

import UIKit

class PostSigninVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exampleRequest = PostSigninRequest(email: "keepdddin@gmail.com", password: "1234abcd")
        PostSigninDataManager().postSignIn(exampleRequest, viewController: self)
    }
    

}

extension PostSigninVC {
    func didSuccessSignIn(message: String) {
        print("서버통신 성공")
        
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
