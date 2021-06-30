//
//  ViewController.swift
//  Keepin-Lab-Tableview
//
//  Created by 김혜수 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    let data : [String] = ["김혜수", "최이준", "이채연", "박윤정", "박윤경", "이은영", "김영민", "손연주", "김보민"]
    var filteredData : [String] = [] // 검색된 결과
    var seletedData : [String] = [] // 선택된 데이터
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        
        registerXib()
        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
        // 검색바!!
        searchbar.delegate = self
    }
    
    func registerXib(){
        let nib = UINib(nibName: TestTVC.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: TestTVC.identifier)
    }


}

// MARK: SearchBar Config
extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            //filteredData = data
        }
        else {
            for name in data {
                if name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(name)
                }
            }
        }
        self.tableview.reloadData()
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2  // index 0: 선택된 친구 / index 1: 검색된 친구
    }
    
    // 각 Section 안에 rows가 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return seletedData.count
        case 1:
            return filteredData.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: TestTVC.identifier, for: indexPath) as? TestTVC
            else { return UITableViewCell()}
            cell.setData(name: seletedData[indexPath.row], clicked: true)
            return cell
            
        case 1:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: TestTVC.identifier, for: indexPath) as? TestTVC
            else { return UITableViewCell()}
            cell.setData(name: filteredData[indexPath.row], clicked: false)
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("먼데..")
            // 여기서 선택하면 해당 내용 filteredData에 추가 후 내용 삭제
            filteredData.append(seletedData[indexPath.row])
            seletedData.remove(at: indexPath.row)
            
        case 1:
            // 여기서 선택하면 해당 내용 삭제 후 section 0 (selectedData에 추가)
            seletedData.append(filteredData[indexPath.row])
            filteredData.remove(at: indexPath.row)
            
        default:
            print("선택")
        }
        tableview.reloadData()
    }
    
    
}



