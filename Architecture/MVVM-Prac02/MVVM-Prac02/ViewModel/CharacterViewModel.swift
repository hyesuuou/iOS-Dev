//
//  CharacterViewModel.swift
//  MVVM-Prac02
//
//  Created by 김혜수 on 2022/01/31.
//

import Foundation

class CharacterViewModel {
    let name: Observable<String?> = Observable(nil)
    let country: Observable<String?> = Observable(nil)
    var index: Int = 0
    var characters: [CharacterModel] = [CharacterModel(name: "스폰지밥", country: "미국"),
                                        CharacterModel(name: "코난", country: "일본"),
                                        CharacterModel(name: "뽀로로", country: "한국"),
                                        CharacterModel(name: "셜록홈즈", country: "영국"),
                                        CharacterModel(name: "치히로", country: "일본")
    ]
    
    init() {
        self.name.value = characters[0].name
        self.country.value = characters[0].country
    }
    
    func tapButton(isPrevious: Bool) {
        if isPrevious {
            index = index > 0 ? index - 1: 0
        }
        else {
            index = index < characters.count - 1 ? index + 1 : characters.count - 1
        }
        self.name.value = characters[index].name
        self.country.value = characters[index].country
    }
}
