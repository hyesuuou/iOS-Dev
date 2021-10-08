//
//  DetailsViewController.swift
//  CustomTransitionVC
//
//  Created by 김혜수 on 2021/10/08.
//

import UIKit

class DetailsViewController: UIViewController {

    //var img: UIImage?
    var spot: Spot?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = spot?.img
        titleLabel.text = spot?.title
        contentsLabel.text = spot?.contents
    }
    @IBAction func dismissButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
