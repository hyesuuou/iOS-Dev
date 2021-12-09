//
//  StoryBrain.swift
//  MVC-ex01
//
//  Created by 김혜수 on 2021/12/10.
//

import Foundation

// MARK: - 데이터의 처리 (Business Logic) 를 담당하는 구조체와 함수 정의할 것
struct StoryBrain {
    
    var stories = [Story(title: "0번이야기", choice1: "Yes", choice1Destination: 1, choice2: "No", choice2Destination: 2),
                   Story(title: "1번이야기", choice1:  "Yes", choice1Destination: 2, choice2: "No", choice2Destination: 3),
                   Story(title: "2번이야기", choice1:  "Yes", choice1Destination: 0, choice2: "No", choice2Destination: 4),
                   Story(title: "3번이야기", choice1: "Yes", choice1Destination: 0, choice2: "No", choice2Destination: 0),
                   Story(title: "4번이야기", choice1: "Yes", choice1Destination: 0, choice2: "No", choice2Destination: 0),
    ]
    
    // MARK: 필요한 변수와 함수 선언
    
    /// 사용자가 버튼을 누를 때 어느 곳으로 가야하는지 추적하는 변수
    var storyNumber = 0
    
    func getStoryLabelText() -> String {
        return stories[storyNumber].title
    }
    
    func getChoice1ButtonText() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoice2ButtonText() -> String {
        return stories[storyNumber].choice2
    }
    
    func getChoice1Destination() -> Int {
        return stories[storyNumber].choice1Destination
    }
    
    func getChoice2Destination() -> Int {
        return stories[storyNumber].choice2Destination
    }
    
    /// 구조체 내의 값 바꾸려면 mutating 키워드가 꼭 필요하다.
    mutating func changeStoryNumber(targetNumber: Int) {
        storyNumber = targetNumber
    }
    
}
