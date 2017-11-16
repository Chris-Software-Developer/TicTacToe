//
//  ViewController.swift
//  TicTacToe
//
//  Created by Christopher Smith on 11/15/17.
//  Copyright © 2017 Christopher Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var player = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    
    let winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    // MARK: IBOutlets
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winningLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        
        if self.gameState[sender.tag - 1] == 0 && self.gameIsActive == true {
            
            self.gameState[sender.tag - 1] = self.player
            
            if self.player == 1 {
                sender.setImage(UIImage(named: "ticTacToeX.png"), for: .normal)
                self.player = 2
            }
            else {
                sender.setImage(UIImage(named: "ticTacToeO.png"), for: .normal)
                self.player = 1
            }
        }
        
        for combo in self.winning {
            
            let firstTag = combo[0]
            let secondTag = combo[1]
            let thirdTag = combo[2]
            
            let firstButtonState = self.gameState[firstTag]
            let secondButtonState = self.gameState[secondTag]
            let thirdButtonState = self.gameState[thirdTag]
            
            let firstButtonPressed = firstButtonState != 0
            
            let firstAndSecondButtonStatesMatch = firstButtonState == secondButtonState
            let secondAndThirdButtonStatesMatch = secondButtonState == thirdButtonState
            
            if firstButtonPressed && firstAndSecondButtonStatesMatch && secondAndThirdButtonStatesMatch {
                
                self.gameIsActive = false
                
                if firstButtonState == 1 {
                    self.winningLabel.text = "X has won!"
                } else {
                    self.winningLabel.text = "O has won!"
                }
                
                self.playAgainButton.isHidden = false
                self.winningLabel.isHidden = false
            }
        }
        
        self.gameIsActive = false
        
        for i in self.gameState {
            
            if i == 0 {
                self.gameIsActive = true
                break
            }
        }
        
        if self.gameIsActive == false {
            self.winningLabel.text = "It was a draw!"
            self.winningLabel.isHidden = false
            self.playAgainButton.isHidden = false
        }
    }
    
    @IBAction func playAgainPushed(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        player = 1
        
        self.playAgainButton.isHidden = true
        self.winningLabel.isHidden = true
        
        for n in 1...9 {
            let button = view.viewWithTag(n) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
}
