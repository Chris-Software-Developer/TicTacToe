//
//  ViewController.swift
//  TicTacToe
//
//  Created by Christopher Smith on 11/15/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var player = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // MARK: - IBActions

    @IBAction func buttonPushed(_ sender: AnyObject) {
        
        if player == 1 {
            sender.setImage(UIImage(named: "ticTacToeX.png"), for: UIControlState())
            player = 2
        } else {
            sender.setImage(UIImage(named: "ticTacToeO.png"), for: UIControlState())
            player = 1
        }
    }
}
