//
//  UIView +.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import Foundation

import UIKit

extension UIView {
     
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func makeRoundedWithBorder(radius: CGFloat, color: CGColor, borderWith: CGFloat = 1) {
            makeRounded(radius: radius)
            self.layer.borderWidth = borderWith
            self.layer.borderColor = color
        }
        
    var asImg: UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
