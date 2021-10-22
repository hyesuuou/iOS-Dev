//
//  PracExtensionTVC.swift
//  ShareSNS
//
//  Created by 김혜수 on 2021/10/21.
//

import UIKit

class PracExtensionTVC: UITableViewCell {
    
    public static let identifier = "PracExtensionTVC"
    
    @IBOutlet weak var txtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: String) {
        txtLabel.text = data
    }

}
