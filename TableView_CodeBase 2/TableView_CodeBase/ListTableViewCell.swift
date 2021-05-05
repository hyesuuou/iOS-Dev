//
//  ListTableViewCell.swift
//  TableView_CodeBase
//
//  Created by 김루희 on 2021/05/04.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    var iconImageView = UIImageView()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        label.textColor = UIColor(white: 243.0 / 255.0, alpha: 1.0) // -> 얘는 제플린 가면 코드 나와있음 복붙하면 됨
        return label
    }()
    
    var subtitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        label.textColor = UIColor(red: 127.0 / 255.0, green: 127.0 / 255.0, blue: 131.0 / 255.0, alpha: 1.0) // -> 얘는 제플린 가면 코드 나와있음 복붙하면 됨
        return label
    }()
    
    var downloadButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "downloadBtn"), for: UIControl.State.normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(downloadButton)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20).isActive = true
        downloadButton.topAnchor.constraint(equalTo: topAnchor, constant: 68).isActive = true
        downloadButton.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(imageName : String, title: String, subtitle: String) {
        if let image = UIImage(named: imageName){
            iconImageView.image = image
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    
}
