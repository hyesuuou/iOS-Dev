//
//  MainTableVC.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/28.
//

import UIKit

class MainTableVC: UIViewController {
    
    var topviewheight : CGFloat = 300
    
    public static let identifier = "MainTableVC"

    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableinview: UIView!
    @IBOutlet weak var labelTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        tableview.tableHeaderView = headerview
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func registerXib(){
//        let nib = UINib(nibName: MainTableHeaderView.identifier, bundle: nil)
//        tableview.register(nib, forCellReuseIdentifier: MainTableHeaderView.identifier)
    }
    
}

extension MainTableVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(tableview.contentOffset.y)
        print("labeltop",labelTop.constant)
        if tableview.contentOffset.y > 0 {
            if tableview.contentOffset.y < 70 {
                labelTop.constant = 100 - tableview.contentOffset.y
            }
        }
        else {
            labelTop.constant = 100
        }
    }
}

extension MainTableVC: UITableViewDelegate {
    
}

extension MainTableVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = UIView()
            //view.backgroundColor = .red
            //tableinview.backgroundColor = .red
            return view
        case 1:
            tableinview.backgroundColor = .blue
            return tableinview
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 200
        case 1:
            return 200
        default:
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
