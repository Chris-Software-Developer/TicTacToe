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
    var gameIsActive = true
    
    let winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winningLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func buttonPushed(_ sender: AnyObject) {
        
        if gameState[sender.tag-1] == 0 && gameIsActive == true {
            gameState[sender.tag-1] = player
            
            if player == 1 {
                sender.setImage(UIImage(named: "ticTacToeX.png"), for: UIControlState())
                player = 2
            }
            else {
                sender.setImage(UIImage(named: "ticTacToeO.png"), for: UIControlState())
                player = 1
            }
        }
        
        for combo in winning {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                
                gameIsActive = false
                
                if gameState[combo[0]] == 1 {
                    winningLabel.text = "X has won!"
                }
                else {
                    winningLabel.text = "O has won!"
                }
                
                playAgainButton.isHidden = false
                winningLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            winningLabel.text = "It was a draw!"
            winningLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBAction func playAgainPushed(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        player = 1
        
        playAgainButton.isHidden = true
        winningLabel.isHidden = true
        
        for n in 1...9 {
            let button = view.viewWithTag(n) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
}
