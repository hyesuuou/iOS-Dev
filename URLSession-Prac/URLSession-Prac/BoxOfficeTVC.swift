//
//  BoxOfficeTVC.swift
//  URLSession-Prac
//
//  Created by 김혜수 on 2021/08/21.
//

import UIKit

class BoxOfficeTVC: UITableViewCell {
    
    public static let identifier = "BoxOfficeTVC"

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(rank: Int, title: String, open: String){
        rankLabel.text = "\(rank)"
        titleLabel.text = title
        openLabel.text = open
    }

}
