//
//  MainScrollVC.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/28.
//

import UIKit

class MainScrollVC: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        bottomViewHeight.constant = UIScreen.main.bounds.height - 200
        tableview.isScrollEnabled = false
    }

}

// MARK:- scrollview
extension MainScrollVC: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollview {
            print("스크롤뷰")
            if scrollview.contentOffset.y >= 200 {
                scrollview.contentOffset.y = 200
                tableview.isScrollEnabled = true
                scrollview.isScrollEnabled = false
            }
            else {
                tableview.isScrollEnabled = false
                scrollview.isScrollEnabled = true
            }
        }
        else if scrollView == tableview  {
            print("테이블뷰")
            if tableview.contentOffset.y <= 0 {
                tableview.isScrollEnabled = false
                scrollview.isScrollEnabled = true
            }
        }
    }
    
    
}

// MARK:- tableview
extension MainScrollVC : UITableViewDelegate {
    
}

extension MainScrollVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}

