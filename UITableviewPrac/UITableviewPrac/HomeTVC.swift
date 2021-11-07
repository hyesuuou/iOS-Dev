//
//  HomeTVC.swift
//  UITableviewPrac
//
//  Created by 김혜수 on 2021/11/07.
//

import UIKit

class HomeTVC: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(title: String) {
        titleLabel.text = title
    }
}
