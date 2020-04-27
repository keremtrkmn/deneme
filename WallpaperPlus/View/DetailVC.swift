//
//  DetailVC.swift
//  WallpaperPlus
//
//  Created by Appendix on 26.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit
import ImageSlideshow

class DetailVC: UIViewController {
    
    var inputArray = [KingfisherSource]()
    var typeModel : TypeModel?
    var wpUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let type = typeModel {
            
            for (key,value) in type.wallpapers[0] {
                if key == "imageUrl" {
                    wpUrl = value as! String
                }
            }
            
            inputArray.removeAll(keepingCapacity: false)
            for wpaperUrl in type.wallpapers[0] {
               
                
            }
            
            let imageslideshow = ImageSlideshow(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            imageslideshow.backgroundColor = UIColor.white
            
            imageslideshow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageslideshow.setImageInputs(inputArray)
        }
    }
    
}
