//
//  ProductCVC.swift
//  CollectionCompositionalLayout
//
//  Created by 김혜수 on 2021/12/19.
//

import UIKit

class ProductCVC: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public static let identifier = "ProductCVC"
    
    func setData(image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
    
}
