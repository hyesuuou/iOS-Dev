//
//  HomeVC.swift
//  CustomTabbarPrac
//
//  Created by 김혜수 on 2021/06/14.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var indicatorBar: UIView!
    
    let titleList : [String] = ["컬리추천", "신상품", "베스트", "알뜰쇼핑", "금주혜택"]
    var nowPage : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    func setScrollTitleColor() {
        if scrollView.contentOffset == CGPoint(x: 0.0, y: 0.0) {
            print("0,0 되나?")
            nowPage = 0
            UIView.animate(withDuration: 0.5){
                //self.indicatorBar.frame.origin.x = CGPoint(x: (390.0/5), y: 130)
                self.indicatorBar.frame.origin.x = 0
            }
            
            
        }
        else if scrollView.contentOffset == CGPoint(x: 390.0, y: 0.0){
            print("390 나옴?") // 나온당 ㅎㅎ
            nowPage = 1
            UIView.animate(withDuration: 0.5){
                self.indicatorBar.frame.origin.x = 390.0/5
            }
            
        }
        else if scrollView.contentOffset == CGPoint(x: 390.0 * 2, y: 0.0){
            print("3번째 뷰컨")
            nowPage = 2
            UIView.animate(withDuration: 0.5){
                self.indicatorBar.frame.origin.x = 390.0/5 * 2
            }
        }
        else if scrollView.contentOffset == CGPoint(x: 390.0 * 3, y: 0.0){
            print("4번째 뷰컨")
            nowPage = 3
            UIView.animate(withDuration: 0.5){
                self.indicatorBar.frame.origin.x = 390.0/5 * 3
            }
        }
        else if scrollView.contentOffset == CGPoint(x: 390.0 * 4, y: 0.0){
            print("5번째 뷰컨")
            nowPage = 4
            print(nowPage)
            UIView.animate(withDuration: 0.5){
                //self.indicatorBar.center = CGPoint(x: (390.0/5)*5, y: 130)
                self.indicatorBar.frame.origin.x = 390.0/5 * 4
            }
            
        }
        
        
        
        
    }
    
    

    
}

// 스크롤뷰
extension HomeVC : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setScrollTitleColor()
        print("스크롤뷰")
        
        collectionView.reloadData()
        
    }
    
    
    
 
    
    
}


// 상단 컬렉션뷰
extension HomeVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 컬렉션뷰 셀이 선택되었을 때
        
        switch indexPath.row {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
 
        case 1:
            scrollView.setContentOffset(CGPoint(x: 390.0, y: 0.0), animated: true)
 
        case 2:
            scrollView.setContentOffset(CGPoint(x: 390.0*2, y: 0.0), animated: true)
 
        case 3:
            scrollView.setContentOffset(CGPoint(x:390.0*3, y:0.0), animated: true)
 
        case 4:
            scrollView.setContentOffset(CGPoint(x: 390.0*4, y: 0.0), animated: true)
 
        default:
            break
        }
        

        print("컬렉션뷰")
        collectionView.reloadData()
        print("컬렉션뷰2")
    }
    
    
    
}

extension HomeVC : UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCVC.identifier, for: indexPath) as? TitleCVC else {
            return UICollectionViewCell()
        }
        
        if nowPage == indexPath.row {
            cell.setData(title: titleList[indexPath.row], selected: true)
            
        }
        else {
            cell.setData(title: titleList[indexPath.row], selected: false)
        }
        
    
        
        
        return cell
    }
    
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(UIScreen.main.bounds.width)
        
        //let cellHeight = UIScreen.main.bounds.width * (338/375)
        
        return CGSize(width: UIScreen.main.bounds.width/5 , height: 80)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}
