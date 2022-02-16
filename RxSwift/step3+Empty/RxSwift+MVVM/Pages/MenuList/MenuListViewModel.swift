//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 김혜수 on 2022/02/15.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

class MenuListViewModel {
    
    //var menuObservable = BehaviorSubject<[Menu]>(value: [])
    var menuObservable = BehaviorRelay<[Menu]>(value: [])
    
    lazy var itemCounts = menuObservable.map {
        $0.map { $0.count }.reduce(0, +)
    }
    //var totalPrice: Int = 10000
    //var totalPrice: Observable<Int> = Observable.just(10000)
    
    // Subject -> Observable과는 다르게 외부에서 값을 통제할수도 있음
    //var totalPrice: PublishSubject<Int> = PublishSubject()
    
    
    
    lazy var totalPrice = menuObservable.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
    init() {
//        let menus: [Menu] = [
//            Menu(id: 0, name: "튀김1", price: 100, count: 0),
//            Menu(id: 1, name: "튀김1", price: 100, count: 0),
//            Menu(id: 2, name: "튀김1", price: 100, count: 0),
//            Menu(id: 3, name: "튀김1", price: 100, count: 0),
//            Menu(id: 4, name: "튀김1", price: 100, count: 0)
//        ]
        
        /* 서버에서 받은 모델 -> 내가 만든 뷰모델 */
        _ = APIService.fetchAllMenusRx()
            .map { data -> [MenuItem] in
                struct Response: Decodable {
                    let menus: [MenuItem]
                }
                let response = try! JSONDecoder().decode(Response.self, from: data)
                return response.menus
            }
            .map { menuItems -> [Menu] in
                var menus: [Menu] = []
                menuItems.enumerated().forEach { (index, item) in
                    let menu = Menu.fromMenuItems(id: index, item: item)
                    menus.append(menu)
                }
                return menus
            }
            .take(1)
            .bind(to: menuObservable)
    }
    
    func clearAllItemSelections() {
        _ = menuObservable
            .map { menus in
                menus.map { m in
                    Menu(id: m.id, name: m.name, price: m.price, count: 0)
                }
            }
            .take(1)
            .subscribe(onNext: {
               // self.menuObservable.onNext($0)
                self.menuObservable.accept($0)
            })
    }
    
    func changeCount(item: Menu, increase: Int) {
        _ = menuObservable
            .map { menus in
                menus.map { m in
                    if m.id == item.id {
                        return Menu(id: m.id, name: m.name, price: m.price, count: max(0,m.count + increase))
                    } else {
                        return Menu(id: m.id, name: m.name, price: m.price, count: m.count)
                    }
                }
            }
            .take(1)
            .subscribe(onNext: {
                // self.menuObservable.onNext($0)
                self.menuObservable.accept($0)
            })
    }
    
    func onOrder() {
        
    }
}
