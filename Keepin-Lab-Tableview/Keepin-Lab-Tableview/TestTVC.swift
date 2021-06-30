//
//  TestTVC.swift
//  Keepin-Lab-Tableview
//
//  Created by 김혜수 on 2021/06/30.
//

import UIKit

class TestTVC: UITableViewCell {
    
    public static let identifier = "TestTVC"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    
    //var clickState : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedLabel.text = "X"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(name : String, clicked : Bool) {
        nameLabel.text = name
        if clicked == true {
            selectedLabel.text = "O"
        }
        else {
            selectedLabel.text = "X"
        }
       
    }
    
//    @IBAction func selectedButtonClicked(_ sender: Any) {
//        if (clickState == true) {
//            clickState = false
//        }
//        else {
//            clickState = true
//        }
//    }
    
}
