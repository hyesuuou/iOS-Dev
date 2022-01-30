//
//  ViewController.swift
//  MVVM-Prac02
//
//  Created by 김혜수 on 2022/01/30.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = CharacterViewModel()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        viewModel.name.bind { [weak self] name in
            self?.nameLabel.text = name
        }
        
        viewModel.country.bind { [weak self] country in
            self?.countryLabel.text = country
        }
    }

    @IBAction func previousButtonDidTap(_ sender: Any) {
        viewModel.tapButton(isPrevious: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        viewModel.tapButton(isPrevious: false)
    }
}

