//
//  PracExtensionVC.swift
//  ShareSNS
//
//  Created by 김혜수 on 2021/10/21.
//

import UIKit

class PracExtensionVC: UIViewController, CustomActivityDelegate  {
    
    var strUrl: URL?
    
    func performActionCompletion(activity: CustomActivity) {
        guard let url = strUrl, UIApplication.shared.canOpenURL(url) else { return }
         UIApplication.shared.open(url, options: [:], completionHandler: nil)


    }
    
    
    var urlList: [String] = []
    let savedata =  UserDefaults.init(suiteName: "group.kim.ShareSNS")
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        tableview.delegate = self
        tableview.dataSource = self
        urlList = savedata?.value(forKey: "urlData") as! [String]
        print(urlList)
        print("vc", savedata?.value(forKey: "urlData"))
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        urlList = savedata?.value(forKey: "urlData") as! [String]
        tableview.reloadData()
    }
    
    func shareContents(shareObject: [Any]) {
        
        /**
         activityItems: 공유하려는 object
         applicationActivities ? : 애플리케이션이 지원하는 커스텀 서비스를 나타내는 UIActivity 객체의 배열로, nil 값이 될 수 있습니다.
         */
        let activityViewController = UIActivityViewController(activityItems: shareObject,
                                                              applicationActivities: nil)
        
        // 2. 기본으로 제공되는 서비스 중 사용하지 않을 UIActivityType 제거(선택 사항)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.addToReadingList,
                                                        UIActivity.ActivityType.assignToContact]
        
        // 3. 컨트롤러를 닫은 후 실행할 완료 핸들러 지정
        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
            if success {
                // 성공했을 때 작업
                print("공유 성공")
               // self.showToast(message: "share success", font: UIFont.systemFont(ofSize: 17))
            }  else  {
                // 실패했을 때 작업
                print("공유 실패")
                //self.showToast(message: "share cancel", font: UIFont.systemFont(ofSize: 17))
            }
        }
        // 4. 컨트롤러 나타내기(iPad에서는 팝 오버로, iPhone과 iPod에서는 모달로 나타냅니다.)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension PracExtensionVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: PracExtensionTVC.identifier) as? PracExtensionTVC else {
            return UITableViewCell()
        }
        cell.setData(data: "\(urlList[indexPath.row])")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        strUrl = URL(string: urlList[indexPath.row])
        let customActivity = CustomActivity()
        customActivity.delegate = self
        let activityVC = UIActivityViewController(activityItems: [urlList[indexPath.row]], applicationActivities: [customActivity])
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
}

