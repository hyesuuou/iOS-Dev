//
//  FruitTVC.swift
//  DiffableDataSource
//
//  Created by 김혜수 on 2021/12/09.
//

import UIKit

class FruitTVC: UITableViewCell {
    
    public static let identifier = "FruitTVC"

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
