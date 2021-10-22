//
//  PracExtensionVC.swift
//  ShareSNS
//
//  Created by 김혜수 on 2021/10/21.
//

import UIKit

class PracExtensionVC: UIViewController {
    
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
    
    
}

