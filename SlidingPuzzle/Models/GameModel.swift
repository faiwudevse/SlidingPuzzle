//
//  GameModel.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/18/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import UIKit

class GameModel: NSObject {
    
    let dimension: Int
    
    var imageboard: Imageboard<TileObject>
    
    init(dimension d: Int) {
        dimension = d
        let tileObject = TileObject(empty: true, value: 0)
        imageboard = Imageboard(dimension: d, initialValue: tileObject)
        super.init()
    }
    
    func reset() {
    }
}
