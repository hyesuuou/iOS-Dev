//
//  mainTVC.swift
//  TableInCollection-Prac
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class mainTVC: UITableViewCell {
    
    public static let identifier = "mainTVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerXib()
    {
        let nib = UINib(nibName: mainCVC.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: mainCVC.identifier)
    }
    
}
