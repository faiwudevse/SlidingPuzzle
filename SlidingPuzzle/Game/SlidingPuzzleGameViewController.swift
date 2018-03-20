//
//  SlidingPuzzleGame.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/14/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import UIKit

class SlidingPuzzleGameViewController: UIViewController{
    
    let topMargin : CGFloat = 60.0
    let distanceToControls : CGFloat = 40.0
    let distanceToGameControls : CGFloat = 20.0
    var dimension: Int
    var board: GameImageView?
    
    init (dimension: Int) {
        self.dimension = dimension
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.white
        setupGestureControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding is not supported")
    }
    override func viewDidLoad() {
        startGame()
    }
    
    func startGame(){
        print("startGame")
        let vcHeight = view.bounds.size.height
        let vcWidth = view.bounds.size.width
        let fontsize = CGFloat(15)
        let myLable = UILabel()
        myLable.text = "Hello"
        myLable.sizeToFit()
        myLable.font = UIFont.systemFont(ofSize: fontsize)
        myLable.frame = CGRect(x: vcWidth/2 - myLable.bounds.size.width/2 , y: topMargin + vcWidth + distanceToControls + distanceToGameControls, width: myLable.bounds.size.width, height: myLable.bounds.size.height)
        let gameboard = GameImageView(dimension: dimension, width: self.view.bounds.size.width, height: self.view.bounds.size.width, x: 0, y: topMargin)
        self.view.addSubview(gameboard)
        self.view.addSubview(myLable)
    }
    
    func setupGestureControl(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc
    func singleTap(_ r: UIGestureRecognizer!){
        
    }
    
    
}
