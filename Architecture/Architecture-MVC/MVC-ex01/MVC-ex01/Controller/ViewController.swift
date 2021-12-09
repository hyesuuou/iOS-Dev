//
//  ViewController.swift
//  MVC-ex01
//
//  Created by 김혜수 on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()

    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var storyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }

    func setData() {
        storyLabel.text = storyBrain.getStoryLabelText()
        choice1Button.setTitle(storyBrain.getChoice1ButtonText(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2ButtonText(), for: .normal)
    }
    
    /// Choice1, 2에 모두 연결되어있음
    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let choice1 = storyBrain.getChoice1ButtonText()
        let choice2 = storyBrain.getChoice2ButtonText()
        
        if userAnswer == choice1 {
            storyBrain.changeStoryNumber(targetNumber: storyBrain.getChoice1Destination())
        }
        else if userAnswer == choice2 {
            storyBrain.changeStoryNumber(targetNumber: storyBrain.getChoice2Destination())
        }
        setData()
    }

}

