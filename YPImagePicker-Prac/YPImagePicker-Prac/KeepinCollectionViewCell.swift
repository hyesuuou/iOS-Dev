//
//  KeepinCollectionViewCell.swift
//  YPImagePicker-Prac
//
//  Created by 김혜수 on 2022/02/24.
//

import UIKit

class KeepinCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeepinCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setData(image: UIImage) {
        imageView.image = image
    }
}
