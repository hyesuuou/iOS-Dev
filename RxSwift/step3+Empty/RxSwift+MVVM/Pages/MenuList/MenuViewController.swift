//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    
    let viewModel = MenuListViewModel()
    var disposeBag = DisposeBag()
    let cellId = "MenuItemTableViewCell"
    

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateUI() // 이걸꼭 해줘야 하냐고.. 그냥 값이 자동으로 바뀌었으면 좋겠다 ..
        
        tableView.dataSource = nil
        
        viewModel.menuObservable
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: MenuItemTableViewCell.self)) { index, item, cell in
                cell.title.text = item.name
                cell.price.text = "\(item.price)"
                cell.count.text = "\(item.count)"
                
                cell.onChange = { [weak self] increase in
                    self?.viewModel.changeCount(item: item, increase: increase)
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.itemCounts
            .map{ "\($0)" }
            .asDriver(onErrorJustReturn: "")
            .drive(itemCountLabel.rx.text)
//            .observeOn(MainScheduler.instance)
//            .bind(to: itemCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.totalPrice
            .map { $0.currencyKR() }
            .observeOn(MainScheduler.instance)
            .bind(to: totalPrice.rx.text)
            .disposed(by: disposeBag)
//        viewModel.itemCounts
//            .map{ "\($0)" }
//            .subscribe(onNext: {
//                self.itemCountLabel.text = $0
//            })
//            .disposed(by: disposeBag)
        
//        viewModel.totalPrice
//            .map { $0.currencyKR() }
//            .subscribe(onNext: {
//                self.totalPrice.text = $0
//            })
//            .disposed(by: disposeBag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        if identifier == "OrderViewController",
            let orderVC = segue.destination as? OrderViewController {
            // TODO: pass selected menus
        }
    }

    func showAlert(_ title: String, _ message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true, completion: nil)
    }

    // MARK: - InterfaceBuilder Links

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var itemCountLabel: UILabel!
    @IBOutlet var totalPrice: UILabel!

    @IBAction func onClear() {
        viewModel.clearAllItemSelections()
    }

    @IBAction func onOrder(_ sender: UIButton) {
        // TODO: no selection
        // showAlert("Order Fail", "No Orders")
        //performSegue(withIdentifier: "OrderViewController", sender: nil)
        //viewModel.totalPrice += 100
        // updateUI() // 이걸꼭 해줘야 하냐고.. 그냥 값이 자동으로 바뀌었으면 좋겠다 ..
        //viewModel.totalPrice.onNext(100)
//        viewModel.menuObservable.onNext([
//            Menu(id: <#Int#>, id: <#Int#>, name: "changed", price: Int.random(in: 100...1000), count: Int.random(in: 0...3)),
//            Menu(name: "changed", price: Int.random(in: 100...1000), count: Int.random(in: 0...3)),
//            Menu(name: "changed", price: Int.random(in: 100...1000), count: Int.random(in: 0...3))
//        ])
    }
    
//    func updateUI() {
//        // 이걸꼭 해줘야 하냐고.. 그냥 값이 자동으로 바뀌었으면 좋겠다 ..
//        itemCountLabel.text = "\(viewModel.itemCounts)"
//        totalPrice.text = viewModel.totalPrice.currencyKR()
//    }
}

//extension MenuViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.menus.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
//        let menu = viewModel.menus[indexPath.row]
//        cell.title.text = menu.name
//        cell.price.text = "\(menu.price)"
//        cell.count.text = "\(menu.count)"
//
//        return cell
//    }
//}
