//
//  KurlyHomePracticeVC.swift
//  CollectionCompositionalLayout
//
//  Created by 김혜수 on 2021/12/19.
//

import UIKit

struct Banner {
    let image: UIImage
}

class KurlyHomePracticeVC: UIViewController {
    
    let bannerList: [Banner] = [Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!)
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createBannerLayout(), animated: true)
        collectionView.dataSource = self
    }
    

}

extension KurlyHomePracticeVC {
    func createBannerLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(UIScreen.main.bounds.height * (340/812)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
        
    }
}

extension KurlyHomePracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVC.identifier, for: indexPath) as? BannerCVC else { return UICollectionViewCell() }
        cell.setData(image: bannerList[indexPath.item].image)
        return cell
    }
    
    
}
