//
//  HomeSelecCardViewController +.swift
//  CardnaPrac
//
//  Created by 김혜수 on 2022/01/06.
//

import UIKit

extension HomeSelectCardViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(section: sectionLayout())
        return layout
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let badgeAnchor = NSCollectionLayoutAnchor(edges: [.top, .trailing],
                                                   fractionalOffset: CGPoint(x: 0, y: 0)
        )
        let badgeSize = NSCollectionLayoutSize(widthDimension: .absolute(25),
                                               heightDimension: .absolute(25))
        let badge = NSCollectionLayoutSupplementaryItem(layoutSize: badgeSize,
                                                        elementKind: BadgeCollectionReusableView.identifier,
                                                        containerAnchor: badgeAnchor)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [badge])
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(164/390), heightDimension: .absolute(210))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 4, bottom: 0, trailing: 10)
        return section
    }
    
    func createCardListLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(section: cardListLayout())
        return layout
    }
    
    func cardListLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 4, bottom: 0, trailing: 10)

        
        return section
    }
}

extension HomeSelectCardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            print(indexPath)
            cardList.remove(at: indexPath.item)
            var snapshot = NSDiffableDataSourceSnapshot<Section,Card>()
            snapshot.appendSections([.main])
            snapshot.appendItems(cardList, toSection: .main)
            dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
        else {
            print("all", indexPath)
           // cardList.insert(allCardList[indexPath.item], at: 0)
            cardList.append(allCardList[indexPath.item])
            var updatedSnapshot = dataSource.snapshot()
            updatedSnapshot.appendItems([allCardList[indexPath.item]], toSection: .main)
            //dataSource.apply(updatedSnapshot)
            dataSource.applySnapshotUsingReloadData(updatedSnapshot, completion: nil)
//            var snapshot = NSDiffableDataSourceSnapshot<Section,Card>()
//            snapshot.appendSections([.main])
//            snapshot.appendItems(cardList, toSection: .main)
//            dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
}
