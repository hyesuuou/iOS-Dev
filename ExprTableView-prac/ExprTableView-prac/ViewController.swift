//
//  ViewController.swift
//  ExprTableView-prac
//
//  Created by 김혜수 on 2021/06/11.
//

import UIKit
import ExpyTableView

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let arraySection0: Array<String> = ["section0_row0","section0_row1","section0_row2"]
    let arraySection1: Array<String> = ["section1_row0","section1_row1","section1_row2","section1_row3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    


}

extension ViewController : ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
        
        switch state {
        case .willExpand:
            print("WILL EXPAND")
            
        case .willCollapse:
            print("WILL COLLAPSE")
            
        case .didExpand:
            print("DID EXPAND")
            
        case .didCollapse:
            print("DID COLLAPSE")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 0 {
                return 40
            }else {
                return 60
            }
        }
    
    
}

extension ViewController : ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        if indexPath.section == 0, indexPath.row == 0 {
            
        }
       }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemGray6 //백그라운드 컬러
        cell.selectionStyle = .none //선택했을 때 회색되는거 없애기
        
        if section == 0 {
            cell.textLabel?.text = arraySection0[0]
        } else {
            cell.textLabel?.text = arraySection1[0]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
                   return arraySection0.count
               } else {
                   return arraySection1.count
               }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
                
                if indexPath.section == 0 {
                    cell.textLabel?.text = arraySection0[indexPath.row]
                } else {
                    cell.textLabel?.text = arraySection1[indexPath.row]
                }
                
                return cell
    }
    
    
}
