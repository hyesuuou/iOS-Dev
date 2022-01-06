//
//  MyCardHomeCollectionViewCell.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import UIKit

class MyCardHomeCollectionViewCell: UICollectionViewCell {
    public static let identifier = "MyCardHomeCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(title: String) {
        titleLabel.text = title
    }
}
