//
//  KeepinViewController.swift
//  YPImagePicker-Prac
//
//  Created by 김혜수 on 2022/02/24.
//

import UIKit

import YPImagePicker

enum ImageCount: Int {
    case none = 0
    case one = 1
    case two = 2
    case three = 3
}

class KeepinViewController: UIViewController {
    
    var images: [UIImage] = [
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func showPicker() {
        var config = YPImagePickerConfiguration()
        
        config.showsPhotoFilters = false
        config.shouldSaveNewPicturesToAlbum = true
        config.startOnScreen = .library
        config.wordings.libraryTitle = "갤러리"
        config.maxCameraZoomFactor = 2.0
        config.library.maxNumberOfItems = 3
        config.gallery.hidesRemoveButton = false
        config.hidesBottomBar = false
        config.hidesStatusBar = false
        config.overlayView = UIView()
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            var i : Int = 0
            
            for item in items {
                switch item {
                case .photo(let photo):
                    self.images.append(photo.image)
                case .video(let video):
                    print(video)
                }
                
                i = i+1
            }
            self.collectionView.reloadData()
            picker.dismiss(animated: true)
        }
        present(picker, animated: true, completion: nil)
    }
}

extension KeepinViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == images.count {
            showPicker()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: KeepinCollectionViewCell.identifier, for: indexPath) as? KeepinCollectionViewCell else { return UICollectionViewCell() }
        guard let plusCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlusCollectionViewCell.identifier, for: indexPath) as? PlusCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.item {
        case 0..<images.count:
            imageCell.setData(image: images[indexPath.item])
            return imageCell
        case images.count:
            if images.count < 3 {
                return plusCell
            }
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
