//
//  RefreshControlVC.swift
//  Animation-Prac
//
//  Created by 김혜수 on 2021/06/07.
//

import UIKit
import Lottie



class RefreshControlVC: UIViewController {

    @IBOutlet weak var sampleTableView: UITableView!
    
    let sampleList : [String] = ["A", "B", "C", "D", "E"]
    
    // 1. UIRefreshControl 인스턴스 생성
    let refreshControl = UIRefreshControl()
    
    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animationView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: 40)
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
        return animationView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        initRefresh()
        // Do any additional setup after loading the view.
    }
    
    func initRefresh(){
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear   // 기존 모양이 보이지 않도록 처리
    
        
//        refreshControl.backgroundColor = .yellow
//        refreshControl.tintColor = .purple
//        refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        
        sampleTableView.refreshControl = refreshControl
    }
    
    @objc func refreshTable(refresh: UIRefreshControl){
        print("새로고침 시작")
        lottieView.isHidden = false
        lottieView.play()
        
        // 딜레이 후 안보이도록
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.sampleTableView.reloadData()
            self.lottieView.isHidden = true
            self.lottieView.stop()
            refresh.endRefreshing()
        }
    }
    
    

    
    

}

extension RefreshControlVC : UITableViewDelegate {
    

}

extension RefreshControlVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let sampleCell = tableView.dequeueReusableCell(withIdentifier: RefreshControlTVC.identifier) as? RefreshControlTVC else { return UITableViewCell() }
        
        sampleCell.setData(data: sampleList[indexPath.row])
        return sampleCell
        
    }
    
    
}
