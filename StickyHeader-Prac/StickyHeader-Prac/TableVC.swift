//
//  TableVC.swift
//  StickyHeader-Prac
//
//  Created by 김혜수 on 2021/07/25.
//

import UIKit

class TableVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func registerXib(){
        let blankNib = UINib(nibName: EmptyTVC.identifier, bundle: nil)
        tableview.register(blankNib, forCellReuseIdentifier: EmptyTVC.identifier)
        
        let headerNib = UINib(nibName: tableheader.identifier, bundle: nil)
        tableview.register(headerNib, forCellReuseIdentifier: tableheader.identifier)
    }

}

extension TableVC : UITableViewDelegate {
    
}

extension TableVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableheader()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0, 1:
            
            guard let cell = tableview.dequeueReusableCell(withIdentifier: EmptyTVC.identifier, for: indexPath) as? EmptyTVC else {
                return UITableViewCell()
            }
            cell.backgroundColor = .red
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
}
