//
//  HomeViewController.swift
//  CustomTransitionVC
//
//  Created by 김혜수 on 2021/10/08.
//

import UIKit

struct Spot {
    let img: UIImage
    let title: String
    let contents: String
}

class HomeViewController: UIViewController {
    
    var data: [Spot] = []

    /// Using Animator
    let transition = PopAnimator()
        
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setDummy()
    }
    
    func setTableView() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exCell") as? exCell else { return UITableViewCell() }
        cell.setData(spot: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.transitioningDelegate = self
        nextVC.spot = data[indexPath.row]
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

// MARK: - UIViewControllerTransitioningDelegate
extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        /// nil 사용 -> 기본 화면전환 
        return nil
    }
}

// MARK: - Dummy
extension HomeViewController {
    
    func setDummy() {
        data = [Spot(img: UIImage(named: "IMG_7B91F85FCE31-1")!, title: "숙명여대", contents: "가을에 명신관 앞에서 찍은 사진~"),
                Spot(img: UIImage(named: "IMG_2326")!, title: "한강", contents: "밤에 여의나루 한강공원을 산책하면서~")]
    }
}
