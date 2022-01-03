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

struct Product {
    let image: UIImage
    let title: String
}

class KurlyHomePracticeVC: UIViewController {
    
    enum HomeSection: Hashable {
        case banner
        case recommendProduct
    }
    
    
    let bannerList: [Banner] = [Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!),
                                Banner(image: UIImage(named: "imgBanner2")!)
    ]
    
    let productList: [Product] = [Product(image: UIImage(named: "imgProduct")!, title: "[우리밀] 두부과자"),
                                  Product(image: UIImage(named: "imgProduct2")!, title: "[우리밀] 두부과자"),
                                  Product(image: UIImage(named: "imgProduct")!, title: "[우리밀] 두부과자"),
                                  Product(image: UIImage(named: "imgProduct2")!, title: "[우리밀] 두부과자")
                                  
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.dataSource = self
    }
    
    
}

extension KurlyHomePracticeVC {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: return self.createBannerLayout()
            case 1: return self.createRecommendProductLayout()
            default: return nil
            }
        }
        return layout
    }
    
    
    func createBannerLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(UIScreen.main.bounds.height * (340/812)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    func createRecommendProductLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(150/375), heightDimension: .absolute(266))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        //
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(65)),
            elementKind: "header",
            alignment: .top)
        
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)),
            elementKind: "footer",
            alignment: .bottom)
        
        section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        
        return section
    }
    
    
}

extension KurlyHomePracticeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return bannerList.count
        case 1: return productList.count
        default: return 0
        }
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCVC.identifier, for: indexPath) as? HeaderCVC else { return UICollectionReusableView() }
//        return view
//
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVC.identifier, for: indexPath) as? BannerCVC else { return UICollectionViewCell() }
            cell.setData(image: bannerList[indexPath.item].image)
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier, for: indexPath) as? ProductCVC else { return UICollectionViewCell() }
            cell.setData(image: productList[indexPath.item].image, title: productList[indexPath.item].title)
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
