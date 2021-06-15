//
//  TitleCVC.swift
//  CustomTabbarPrac
//
//  Created by 김혜수 on 2021/06/14.
//

import UIKit

class TitleCVC: UICollectionViewCell {
    
    public static let identifier = "TitleCVC"
    
    @IBOutlet public weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(title : String, selected : Bool){
        titleLabel.text = title
        if selected == true {
            titleLabel.textColor = .purple
        }
        else {
            titleLabel.textColor = .gray
        }
        
    }

    
}
