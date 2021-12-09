//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by 김혜수 on 2021/12/09.
//

import UIKit

enum Section {
    case main
}

struct Fruit: Hashable {
    var title: String
    /// 아래 부분 없으면 같은 title추가했을 때 오류남
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

class ViewController: UIViewController {
    
    var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    var fruits: [Fruit] = []
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigationBarUI()
    }

    func setTableView() {
        tableview.delegate = self
        dataSource = UITableViewDiffableDataSource(tableView: tableview, cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitTVC.identifier, for: indexPath) as? FruitTVC else { return UITableViewCell() }
            cell.setData(title: model.title)
            return cell
        })
    }
    
    func setNavigationBarUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
        
        for i in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "Fruit \(i+1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "Fruit \(i+1)")
                self?.fruits.append(fruit)
                self?.updateDataSource()
            }))
        }
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.main])
        snapshot.appendItems(fruits)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate {
    
}
