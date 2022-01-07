//
//  BadgeCollectionReusableView.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/07.
//

import UIKit

class BadgeCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "BadgeCollectionReusableView"
   // let label = UILabel()
    let lineView = UIView()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
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
        backgroundColor = .white
        lineView.backgroundColor = .red
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 20)
        ])
        lineView.layer.cornerRadius = 5
        configureBorder()
    }
    
//    func configure() {
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.adjustsFontForContentSizeCategory = true
//        addSubview(label)
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: centerYAnchor)
//            ])
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        label.textAlignment = .center
//        label.textColor = .red
//        backgroundColor = .white
//        configureBorder()
//    }
//
    func configureBorder() {
        let radius = bounds.width / 2.0
        layer.cornerRadius = radius
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}

    
