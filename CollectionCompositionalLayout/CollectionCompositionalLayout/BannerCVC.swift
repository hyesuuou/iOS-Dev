//
//  BannerCVC.swift
//  CollectionCompositionalLayout
//
//  Created by κΉνμ on 2021/12/19.
//

import UIKit

class BannerCVC: UICollectionViewCell {
    
    public static let identifier = "BannerCVC"
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(image: UIImage) {
        imageView.image = image
    }
    
}
