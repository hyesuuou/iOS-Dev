//
//  HomeViewController.swift
//  CustomTransitionVC
//
//  Created by κΉνμ on 2021/10/08.
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
        return 450
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
        /// nil μ¬μ© -> κΈ°λ³Έ νλ©΄μ ν
        return nil
    }
}

// MARK: - Dummy
extension HomeViewController {
    
    func setDummy() {
        data = [Spot(img: UIImage(named: "IMG_7B91F85FCE31-1")!, title: "μλͺμ¬λ", contents: "κ°μμ λͺμ κ΄ μμμ μ°μ μ¬μ§~"),
                Spot(img: UIImage(named: "IMG_2326")!, title: "νκ°", contents: "λ°€μ μ¬μλλ£¨ νκ°κ³΅μμ μ°μ±νλ©΄μ~")]
    }
}
