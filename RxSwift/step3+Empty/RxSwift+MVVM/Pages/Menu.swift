//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by 김혜수 on 2022/02/15.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation

// Model: View를 위한 Model (서버에서 어떤게 올지는 모르는 상황) -> ViewModel
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}

extension Menu {
    static func fromMenuItems(id: Int, item: MenuItem) -> Menu {
        return Menu(id: id, name: item.name, price: item.price, count: 0)
    }
}
