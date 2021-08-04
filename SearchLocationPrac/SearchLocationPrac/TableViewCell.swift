//
//  TableViewCell.swift
//  SearchLocationPrac
//
//  Created by 김혜수 on 2021/08/05.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    public static let identifier = "TableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String){
        titleLabel.text = title
    }

}
