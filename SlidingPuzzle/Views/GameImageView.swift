//
//  GameImageView.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/18/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import UIKit

class GameImageView: UIView{

//    var width: CGFloat
//    var height: CGFloat
    
    var dimension: Int
    var imageTiles: Dictionary<IndexPath, ImageTileView>
    var matrix: Array<Array<ImageTileView>>
    var side: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    
    init(dimension d: Int, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat){
        dimension = d
        imageTiles = Dictionary()
        matrix = Array()
        side = width
        imageWidth = side / CGFloat(dimension)
        imageHeight = side / CGFloat(dimension)
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        configureImageView()
    }
    
    func configureImageView(){
        let path = Bundle.main.path(forResource: "image", ofType: "png")
        let oriImage = UIImage(contentsOfFile: path!)

        let width = side / CGFloat(dimension)
        let height = side / CGFloat(dimension)
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        
        for i in 0 ..< dimension{
            var row: Array<ImageTileView> = Array()
            for j in 0 ..< dimension {
                let cgImage = oriImage!.cgImage?.cropping(to: CGRect(x: CGFloat(j) * width, y: CGFloat(i) * height, width: width, height: height))
                let image = UIImage(cgImage: cgImage!)
                let isEmpty = i == j && i == dimension - 1
                let imageTileView = ImageTileView(image: isEmpty ? nil : image)
                UIView.animate(withDuration: 0.2, animations: {
                    imageTileView.frame = CGRect(x: CGFloat(j) * width, y: CGFloat(i) * height, width: width, height: height)
                })
                row.append(imageTileView)
                addSubview(imageTileView)
                imageTiles[IndexPath(row: i,section: j)] = imageTileView
            }
            matrix.append(row)
        }
        shuffleViews()
    }
    
    func shuffleViews(){
        var arr : [Int] = []
        for num in 0 ..< dimension * dimension {
            arr.append(num)
        }
        for i in 0 ..< dimension{
            for j in 0 ..< dimension{
                let random = Int(arc4random() % UInt32(arr.count))
                let pos = convertOneDToTwoD(index: arr.remove(at: random))
                matrix[i][j].frame = CGRect(x: CGFloat(pos.0) * imageWidth, y: CGFloat(pos.1) * imageHeight, width: imageWidth, height: imageHeight)
            }
        }
    }
    
    func convertOneDToTwoD(index: Int) -> (Int, Int){
        let y = index % dimension
        let x = (index - y) / dimension
        return (x,y)
    }
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}
