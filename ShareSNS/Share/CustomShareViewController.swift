//
//  CustomShareViewController.swift
//  Share
//
//  Created by 김혜수 on 2021/10/21.
//

import UIKit

class CustomShareViewController: UIViewController {

    override func viewDidLoad() {
        ///setupNavBar()override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults(suiteName: "group.kim.ShareSNS.Share")
        let data = defaults?.string(forKey: "share")
        let alert = UIAlertController(title: "알림", message: "여기는 ShareViewController : \(data)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {
            (a) -> Void in
            let board = UIStoryboard(name: "MainInterface", bundle: nil)
            self.present(board.instantiateViewController(withIdentifier: "abc"), animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        print("취소")
        let error = NSError(domain: "kimhyesu.ShareSNS.Share",
                            code: 0,
                            userInfo: [NSLocalizedDescriptionKey: "An error description"])
        extensionContext?.cancelRequest(withError: error)
    }
    
    @IBAction func shareButtonClicked(_ sender: Any) {
       print("공유")
//            extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
        
    }
    
    
       
    
}
