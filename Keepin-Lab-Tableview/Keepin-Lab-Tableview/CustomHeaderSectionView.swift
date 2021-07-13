//
//  CustomHeaderSectionView.swift
//  Keepin-Lab-Tableview
//
//  Created by 김혜수 on 2021/07/01.
//

import UIKit

class CustomHeaderSectionView: UITableViewHeaderFooterView {

    public static let identifier = "CustomHeaderSectionView"
    
    @IBOutlet weak var headerTitle: UILabel!
    
    func setData(title : String) {
        headerTitle.text = title
        headerTitle.textColor = .black
    }

}
