//
//  HomeViewController.swift
//  CustomTabbarPrac
//
//  Created by 김혜수 on 2021/05/28.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let titleList : [String] = ["컬리추천", "신상품", "베스트", "알뜰쇼핑", "금주혜택"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
       
    }
    

    

}

extension HomeViewController : UICollectionViewDelegate {
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCVC.identifier, for: indexPath) as? TitleCVC else {
            return UICollectionViewCell()
        }
        //cell.setData(title: titleList[indexPath.row])
        return cell
        
    }
    
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(UIScreen.main.bounds.width)
        
        //let cellHeight = UIScreen.main.bounds.width * (338/375)
        
        return CGSize(width: UIScreen.main.bounds.width/6 , height: 80)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
