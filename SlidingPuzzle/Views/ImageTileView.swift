//
//  ImageTileView.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/16/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import UIKit

class ImageTileView: UIImageView {
    var value: Int?
    var empty: Bool {
        get {
            return self.empty
        }
        set (newEmpty) {
            if newEmpty {
                self.layer.borderWidth = 0.0
            }
            else{
                self.backgroundColor = UIColor.clear
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not suppored")
    }
    
    override init(image: UIImage?){
        super.init(image: image)
        self.empty = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
    
}
