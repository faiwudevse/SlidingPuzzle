//
//  ViewController.swift
//  SlidingPuzzle
//
//  Created by Fai Wu on 3/14/18.
//  Copyright © 2018 Fai Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func startGameButtonTapped(sender: UIButton){
        let game = SlidingPuzzleGameViewController(dimension: sender.tag)
        self.present(game, animated: true, completion: nil)
    }
    
}

