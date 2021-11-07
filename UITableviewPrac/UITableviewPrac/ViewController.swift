//
//  ViewController.swift
//  UITableviewPrac
//
//  Created by 김혜수 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    var list = ["1", "2", "3", "4", "5"]
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.dragInteractionEnabled = true
        tableview.dragDelegate = self
        tableview.dropDelegate = self
    }
    
    
    
}

extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
    
    
}

extension ViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let share = UIContextualAction(style: .normal, title: "공유") { action, view, completion in
            print("공유")
            completion(true)
        }
        share.backgroundColor = .systemBlue
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { action, view, completion in
            print("삭제메서드 구현")
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
            completion(true)
        }
        
        delete.backgroundColor = .systemPink
        
        return UISwipeActionsConfiguration(actions: [delete, share])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let star = UIContextualAction(style: .normal, title: "🌟") { action, view, completion in
            completion(true)
        }
        star.backgroundColor = .yellow
        return UISwipeActionsConfiguration(actions: [star])
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as? HomeTVC else { return UITableViewCell() }
        cell.setData(title: list[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("\(sourceIndexPath.row) -> \(destinationIndexPath.row)")
        let moveCell = self.list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(moveCell, at: destinationIndexPath.row)
    }
    
}
