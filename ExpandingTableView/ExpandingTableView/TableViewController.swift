//
//  TableViewController.swift
//  ExpandingTableView
//
//  Created by 김혜수 on 2021/06/16.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}


class TableViewController: UITableViewController {

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableViewData = [cellData(opened: false, title: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"])
                         ,cellData(opened: false, title: "Title2", sectionData: ["Cell1", "Cell2", "Cell3"])
                         ,cellData(opened: false, title: "Title3", sectionData: ["Cell1", "Cell2", "Cell3"])
                         ,cellData(opened: false, title: "Title4", sectionData: ["Cell1", "Cell2", "Cell3"])]
        

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 만약 테이블뷰Data가 열려있으면
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1 // numberOfRowsInSection 의 리턴값이 섹션이 열려있는 거니까 sectionData의 수 만큼
        }
        else {
            return 1   // 안열려있으면 1
        }
    }
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            
            
            return cell
        default:
            // Use Different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
        
       
        

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section,"+", indexPath.row)
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                // open==true인 상태에서 tableViewCell을 클릭하면 닫힌 상태로(false)로 바뀌어야 한다.
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
            }
            else {
                // open == false인 상태에서 tableviewCell을 클릭하면 열린(opened=>true)상태로 바꿔야 한다.
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    

}
