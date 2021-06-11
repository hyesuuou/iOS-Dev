//
//  RefreshControlTVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/07.
//

import UIKit

class RefreshControlTVC: UITableViewCell {

    static let identifier : String = "RefreshControlTVC"
    
    @IBOutlet weak var sampleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data : String){
        sampleLabel.text = data
    }

}
