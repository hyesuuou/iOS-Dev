//
//  ViewController.swift
//  TableView_CodeBase
//
//  Created by 김루희 on 2021/05/04.
//

import UIKit


class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    //MARK: - Property
    
    var appList = [ListDataModel(iconImageName: "soptAppIcon1",
                                 title: "OUNCE - 집사를 위한 똑똑한 기록장",
                                 subtitle: "우리 고양이의 까다로운 입맛 정리 서비스"),
                   
                   ListDataModel(iconImageName: "soptAppIcon2",
                                 title: "포켓유니브",
                                 subtitle: "MZ세대를 위한, 올인원 대학생활 관리 플랫폼"),
                   
                   ListDataModel(iconImageName: "soptAppIcon3",
                                 title: "MOMO",
                                 subtitle: "책 속의 문장과 함께 쓰는 일기"),
                   
                   ListDataModel(iconImageName: "soptAppIcon4",
                                 title: "Weathy(웨디)",
                                 subtitle: "나에게 돌아오는 맞춤 날씨 서비스"),
                   
                   ListDataModel(iconImageName: "soptAppIcon5",
                                 title: "BeMe",
                                 subtitle: "나를 알아가는 질문 다이어리"),
                   
                   ListDataModel(iconImageName: "soptAppIcon6",
                                 title: "placepic",
                                 subtitle: "우리들끼리 공유하는 최애장소, 플레이스픽"),
                   
                   ListDataModel(iconImageName: "soptAppIcon7",
                                 title: "몽글(Mongle)",
                                 subtitle: "우리가 만드는 문장 큐레이션 플랫폼, 몽글")]

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        // xcode가 알아서 constraint값을 설정해준다. (true일때) -> 우리가 설정할거면 false로 설정해야함!
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
    //MARK: - Helpers

}

//MARK: - Extension

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.setData(imageName: appList[indexPath.row].iconImageName, title: appList[indexPath.row].title, subtitle: appList[indexPath.row].subtitle)
        
        return cell
    }
}

