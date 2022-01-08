//
//  HomeSelectCardViewController.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import UIKit

class HomeSelectCardViewController: UIViewController {
    
    // MARK: - Property
    var dataSource: UICollectionViewDiffableDataSource<Section, Card>!
    var allDataSource: UICollectionViewDiffableDataSource<Section, Card>!
    var selectedCardList: [Card] = [] /// 선택된 카드
    var cardList: [Card] = [Card(title: "카드1"), Card(title: "카드2"), Card(title: "카드3"), Card(title: "카드4"), Card(title: "카드5")] /// 전체 카드 리스트
    var allCardList: [Card] = [Card(title: "카드6"), Card(title: "카드7"), Card(title: "카드8"), Card(title: "카드9"), Card(title: "카드10")]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var allCardCollectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setCollectionView()
        
       // self.navigationController?.navigationBar.titleTextAttributes = .
    }
    
    // MARK: - Function
    
    func setData() {
        titleLabel.text = "나를 가장 잘 표현하는 카드를\n대표카드로 지정해보세요!"
    }
    
    
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        allCardCollectionView.setCollectionViewLayout(createCardListLayout(), animated: true)
        allCardCollectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCardHomeCollectionViewCell.identifier, for: indexPath) as? MyCardHomeCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.zPosition = -100
            cell.setData(title: itemIdentifier.title)
            return cell
        })
        allDataSource = UICollectionViewDiffableDataSource(collectionView: allCardCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCardHomeCollectionViewCell.identifier, for: indexPath) as? MyCardHomeCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.zPosition = -100
            cell.setData(title: itemIdentifier.title)
            return cell
        })
        collectionView.backgroundColor = .clear
        collectionViewDataApply()
        collectionView.delegate = self
        allCardCollectionView.delegate = self
    }
    
    func collectionViewDataApply() {
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <BadgeCollectionReusableView>(elementKind: BadgeCollectionReusableView.identifier) {
            (badgeView, string, indexPath) in
        }
        
        
        dataSource.supplementaryViewProvider = {
           return self.collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: $2)
        }
        
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cardList, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        
        var allSnapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        allSnapshot.appendSections([.main])
        allSnapshot.appendItems(allCardList, toSection: .main)
        
        allDataSource.apply(allSnapshot)
    }
    
    

}
