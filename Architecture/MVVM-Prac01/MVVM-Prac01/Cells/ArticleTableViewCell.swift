//
//  ArticleTableViewCell.swift
//  MVVM-Prac01
//
//  Created by 김혜수 on 2022/01/30.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    static let identifier = "ArticleTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
