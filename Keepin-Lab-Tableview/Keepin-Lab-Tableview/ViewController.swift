//
//  ViewController.swift
//  Keepin-Lab-Tableview
//
//  Created by 김혜수 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    let data : [String] = ["김혜수", "최이준", "이채연", "박윤정", "박윤경", "이은영", "김영민", "손연주", "김보민"]
    var filteredData : [String]!
    
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
            filteredData = data
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: TestTVC.identifier, for: indexPath) as? TestTVC
        else { return UITableViewCell()}
        cell.setData(name: filteredData[indexPath.row])
        return cell
    }
    
    
}



