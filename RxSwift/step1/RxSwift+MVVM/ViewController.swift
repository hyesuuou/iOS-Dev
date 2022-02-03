//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }

    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    // Observable의 생명주기
    // 1. Create
    // 2. Subscribe -> 이 때 Observable이 실행됨 !!!
    // 3. onNext
    // 4. onCompleted / onError -> 끝
    // 5. Disposed
    
    
    func downloadJson(_ url: String) -> Observable<String?> {
        /// 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
        //return Observable.from(["Hello", "World"])
        
        return Observable.create() { emitter in
            let url = URL(string: url)!
            let task = URLSession.shared.dataTask(with: url) { data, _, err in
                guard err == nil else {
                    emitter.onError(err!)
                    return
                }
                if let dat = data, let json = String(data: dat, encoding: .utf8) {
                    emitter.onNext(json)
                }
                emitter.onCompleted()
            }
            task.resume()
            
            return Disposables.create() {
                /// 취소했을 때 해야하는 행동
                task.cancel()
            }
        }
        
        /*
        return Observable.create { f in
            DispatchQueue.global().async {
                let url = URL(string: url)!
                let data = try! Data(contentsOf: url)
                let json = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    f.onNext(json)
                    f.onCompleted()
                }
            }
            return Disposables.create()
        }
         */
    }
    
    /*
    func downloadJson(_ url: String, _ completion: @escaping (String?) -> Void) {
        DispatchQueue.global().async {
            let url = URL(string: url)!
            let data = try! Data(contentsOf: url)
            let json = String(data: data, encoding: .utf8)
            DispatchQueue.main.async {
                completion(json)
            }
        }
    }
    */

    // MARK: SYNC

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        editView.text = ""
        setVisibleWithAnimation(activityIndicator, true)
        
        /// 2. Observable로 오는 데이터를 받아서 처리하는 방법
        ///
        
        _ = downloadJson(MEMBER_LIST_URL)
            .map { json in json?.count ?? 0 }
            .filter({ cnt in cnt > 0 })
            .map { "\($0)" }
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .subscribe(onNext: { json in
                self.editView.text = json
                self.setVisibleWithAnimation(self.activityIndicator, false)
            })
        
//        downloadJson(MEMBER_LIST_URL)
//            .subscribe(onNext: { json in
//                DispatchQueue.main.async {
//                    self.editView.text = json
//                    self.setVisibleWithAnimation(self.activityIndicator, false)
//                }
//            })
        
//        downloadJson(MEMBER_LIST_URL)
//            .subscribe { event in
//                switch event {
//                case let .next(json):
//                    DispatchQueue.main.async {
//                        self.editView.text = json
//                        self.setVisibleWithAnimation(self.activityIndicator, false)
//                    }
//
//                case .error(_):
//                    break
//                case .completed:
//                    break
//                }
//            }
//
//        let observable = downloadJson(MEMBER_LIST_URL)
//        // observable이 종료되면 사라지고 순환참조 끝
//        let disposable = observable.subscribe { event in
//            switch event {
//            case .next(let data):
//                print(data)
//            case .error(_):
//                break
//            case .completed:
//                break
//            }
//        }
          _ = downloadJson(MEMBER_LIST_URL)
            .subscribe(onNext: { print($0) },
                       onCompleted: { print("completed") })
        
    }
}
