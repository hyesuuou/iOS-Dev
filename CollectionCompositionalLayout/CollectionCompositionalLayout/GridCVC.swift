//
//  GridCVC.swift
//  CollectionCompositionalLayout
//
//  Created by 김혜수 on 2021/12/19.
//

import UIKit

class GridCVC: UICollectionViewCell {
    
    public static let identifier = "GridCVC"
    //var data = ""
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //label.text = data
    }
    
    func setData(text: String) {
        label.text = text
    }
}
