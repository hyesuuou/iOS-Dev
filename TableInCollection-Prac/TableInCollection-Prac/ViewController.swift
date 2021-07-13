//
//  ViewController.swift
//  TableInCollection-Prac
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func registerXib(){
        let nib = UINib(nibName: mainTVC.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: mainTVC.identifier)
    }


}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: mainTVC.identifier, for: indexPath) as? mainTVC else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

