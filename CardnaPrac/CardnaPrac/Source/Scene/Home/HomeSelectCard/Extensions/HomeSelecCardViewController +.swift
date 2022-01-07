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
                                                   fractionalOffset: CGPoint(x: 0.3, y: -0.3))
        let badgeSize = NSCollectionLayoutSize(widthDimension: .absolute(30),
                                               heightDimension: .absolute(30))
        let badge = NSCollectionLayoutSupplementaryItem(layoutSize: badgeSize,
                                                        elementKind: BadgeCollectionReusableView.identifier,
                                                        containerAnchor: badgeAnchor)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [badge])
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(164/390), heightDimension: .absolute(210))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 4, bottom: 0, trailing: 10)
        
        
        
       // let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: GeneralSectionLayout.sectionHeaderElementKind, alignment: .top)
//        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
