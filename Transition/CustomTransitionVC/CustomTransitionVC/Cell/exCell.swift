//
//  exCell.swift
//  CustomTransitionVC
//
//  Created by 김혜수 on 2021/10/09.
//

import UIKit

class exCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(spot: Spot) {
        img.image = spot.img
        titleLabel.text = spot.title
    }

}
