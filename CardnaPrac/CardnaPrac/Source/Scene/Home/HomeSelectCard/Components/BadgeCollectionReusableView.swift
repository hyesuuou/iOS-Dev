//
//  BadgeCollectionReusableView.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/07.
//

import UIKit

class BadgeCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "BadgeCollectionReusableView"
    let lineView = UIView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.configure()
        }
        
    }

    override var frame: CGRect {
        didSet {
            configureBorder()
        }
    }
    override var bounds: CGRect {
        didSet {
           configureBorder()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension BadgeCollectionReusableView {
    func configure() {
        
        self.backgroundColor = .white
        lineView.backgroundColor = .red
        self.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lineView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 15),
            lineView.heightAnchor.constraint(equalToConstant: 2)

        ])
        lineView.layer.cornerRadius = 2
        configureBorder()
    }
    
    func configureBorder() {
        let radius = bounds.width / 2.0
        layer.cornerRadius = radius
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}

    
