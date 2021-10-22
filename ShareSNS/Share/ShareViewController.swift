//
//  ShareViewController.swift
//  Share
//
//  Created by 김혜수 on 2021/10/20.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
    var convertedString: String?
    
    override func isContentValid() -> Bool {
        return contentText.isEmpty == false
    }
    
    
    override func didSelectPost() {
        
        let extensionItems = extensionContext?.inputItems as! [NSExtensionItem]
        print("extensionContext: ", extensionContext)
        print("extensionItems: ", extensionItems)
        
        for items in extensionItems {
            if let itemProviders = items.attachments {
                for item_provider in itemProviders {
                    if item_provider.hasItemConformingToTypeIdentifier(kUTTypeImage as String) {
                        item_provider.loadItem(forTypeIdentifier: kUTTypeImage as String, options: nil) { (data, error) in
                            print("Image : \(data)")
                        }
                    }
                    
                    
                    if item_provider.hasItemConformingToTypeIdentifier(kUTTypeURL as String) {
                        
                        item_provider.loadItem(forTypeIdentifier: kUTTypeURL as String, options: nil) { (data, error) in
                        
                            
                            let savedata =  UserDefaults.init(suiteName: "group.kim.ShareSNS")
                            
                            if let url = data as? URL{
                                
                                var arrayList : [String] = []
                                
                                if let allData = savedata?.object(forKey: "urlData"){
                                    
                                    if let tempList = allData as? NSArray{
                                        arrayList = tempList as! [String]
                                    }
                                    
                                }
                                
                                let test = url.absoluteString
                                
                                arrayList.append(test)
                                
                                print(arrayList)
                                
                                savedata?.setValue(arrayList, forKey: "urlData")
                                //print("프린트", savedata?.value(forKey: "urlData"))
                                savedata?.synchronize()
                                
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
        self.extensionContext!.completeRequest(returningItems: []) { (success: Bool) -> Void in
            print(success)
        }


    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        let item = SLComposeSheetConfigurationItem()!
        item.title = "title"
        item.value = "value"
        item.tapHandler = {
            print("실행")
        }
        
        let item2 = SLComposeSheetConfigurationItem()!
        item2.title = "title"
        item2.value = "value"
        item2.tapHandler = {
            print("실행")
        }
        
        return [item, item2]
    }
}
