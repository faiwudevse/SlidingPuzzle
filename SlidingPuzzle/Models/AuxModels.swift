//
//  AuxModels.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/18/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import Foundation

/// An enum representing directions supported by the game model.
enum MoveDirection {
    case up, down, left, right
}

/// An enum representing either an empty space or a tile upon the board.
struct TileObject {
    var empty : Bool
    var value : Int
}


struct Imageboard<T> {
    let dimension : Int
    var boardArray : [T]
    
    init(dimension d: Int, initialValue: T) {
        dimension = d
        boardArray = [T](repeating: initialValue, count: d*d)
    }
    
    subscript(row: Int, col: Int) -> T {
        get {
            assert(row >= 0 && row < dimension)
            assert(col >= 0 && col < dimension)
            return boardArray[row*dimension + col]
        }
        set {
            assert(row >= 0 && row < dimension)
            assert(col >= 0 && col < dimension)
            boardArray[row*dimension + col] = newValue
        }
    }
    
    // We mark this function as 'mutating' since it changes its 'parent' struct.
    mutating func setAll(to item: T) {
        for i in 0..<dimension {
            for j in 0..<dimension {
                self[i, j] = item
            }
        }
    }
}
