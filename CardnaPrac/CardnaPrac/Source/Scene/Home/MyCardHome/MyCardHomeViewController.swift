//
//  MyCardHomeViewController.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import UIKit

enum Section {
    case main
}

class MyCardHomeViewController: UIViewController {
    
    // MARK: - Property
    var dataSource: UICollectionViewDiffableDataSource<Section, Card>!
    var cardList: [Card] = [Card(title: "카드1"), Card(title: "카드2"), Card(title: "카드3")]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var homeTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setCollectionView()
    }
    
    // MARK: - Function
    
    func setData() {
        homeTitleLabel.text = "지우님은\n갤럭시유저!"
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCardHomeCollectionViewCell.identifier, for: indexPath) as? MyCardHomeCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(title: itemIdentifier.title)
            return cell
        })
        collectionView.backgroundColor = .clear
        collectionViewDataApply()
    }
    
    func collectionViewDataApply() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cardList, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }

    // MARK: - IBAction
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        let editVC = UIStoryboard(name: "HomeSelectCard", bundle: nil).instantiateViewController(withIdentifier: "HomeSelectCardViewController")
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
}
