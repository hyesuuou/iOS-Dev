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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(name : String) {
        nameLabel.text = name
    }
    
}
