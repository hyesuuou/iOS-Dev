//
//  ViewController.swift
//  Userdefaults-Prac
//
//  Created by 김혜수 on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    var genre : Genre = Genre(id: 1, name: "액션")
    
    var genres : [Genre] = [Genre(id: 1, name: "액션")
                           , Genre(id: 2, name: "로맨스")
                           , Genre(id: 3, name: "공포")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // UserDefaults에 struct 저장하기
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        // 데이터를 인코딩하여 저장한다.
        UserDefaults.standard.set(try? PropertyListEncoder().encode(genres), forKey: "genres")
    }
    
    // UserDefaults 에 저장된 값 가져오기
    @IBAction func getValueButtonClicked(_ sender: Any) {
        if let data = UserDefaults.standard.value(forKey: "genres") as? Data {
            let getData = try? PropertyListDecoder().decode([Genre].self, from: data)
            print("값",getData)
        }
        
    }
    
    
    
    
}

