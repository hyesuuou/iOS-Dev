//
//  ViewController.swift
//  YPImagePicker-Prac
//
//  Created by 김혜수 on 2021/07/11.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {
    
    var pickedIMG : [UIImage] = []
    
    
    
    @IBOutlet var imageView: [UIImageView]!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageCV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func showPicker() {
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
                    print(photo)
                    self.pickedIMG.append(photo.image)
                    self.imageView[i].image = photo.image
                    
                case .video(let video):
                    print(video)
                }
                
                i = i+1
            }
            
            picker.dismiss(animated: true)
        }
        present(picker, animated: true, completion: nil)
    }
        

    
}

