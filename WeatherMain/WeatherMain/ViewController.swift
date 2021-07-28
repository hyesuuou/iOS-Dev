//
//  ViewController.swift
//  WeatherMain
//
//  Created by 김혜수 on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

    var cityList : [String] = ["마포구", "용산구", "수원시"]
    var color : [UIColor] = [UIColor.red, UIColor.green, UIColor.purple]
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        scrollview.delegate = self
    }
    
    func setUI(){
        for index in 0..<cityList.count {
            
            let containview = UIView()
            
            let sb = UIStoryboard(name: "Base", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: BaseVC.identifier)
            
            //self.addChild(vc)
            containview.frame = UIScreen.main.bounds
            containview.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollview.addSubview(containview)
            BaseVC.colors = color[index]
            //vc.view.backgroundColor = color[index]
            containview.addSubview(vc.view)
            
            
            
//            let subview = UIView()
//            print("아놔")
//            subview.frame = UIScreen.main.bounds
//            //subview.backgroundColor = color[index]
//            subview.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
//            scrollview.addSubview(subview)
        }
        
        scrollview.contentSize = CGSize(
            width: UIScreen.main.bounds.width * CGFloat(cityList.count), height: UIScreen.main.bounds.height
        )
        
        scrollview.alwaysBounceVertical = false
        pagecontroller.numberOfPages = cityList.count
    }

    // pagecontroller의 IBAction -> 상태가 바뀌면 호출됨
    @IBAction func pageChanged(_ sender: Any) {
        UIView.animate(withDuration: 0.3){
            self.scrollview.contentOffset.x = UIScreen.main.bounds.width * CGFloat(self.pagecontroller.currentPage)
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    // scrollview가 움직일 때 호출
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pagecontroller.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load2"), object: nil)
//        if scrollview.contentOffset.y > 0 {
//            //self.topviewHieght.constant -= scrollview.frame.height
//            vc.topviewHieght.constant = 100
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//        }
//        else {
//            print("내릴때")
//            topviewHieght.constant = 300
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//        }
    }
}


