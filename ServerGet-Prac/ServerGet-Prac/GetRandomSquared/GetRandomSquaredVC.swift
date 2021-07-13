//
//  GetRandomSquaredVC.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//

import UIKit

class GetRandomSquaredVC: UIViewController {

    @IBOutlet weak var memoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        DataManager().reqNew(self)
    }
    
    
    

    

}
