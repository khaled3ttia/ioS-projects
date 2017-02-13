//
//  gameLogic.swift
//  tic
//
//  Created by Khaled  on 2/13/17.
//  Copyright © 2017 Khaled . All rights reserved.
//

import Foundation

class GameLogic{
    
    private var activePlayer = 1
    private var playGround = [0,0,0,0,0,0,0,0,0]
    private let winningCombinations = [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]
    private var gameActive = true
    private var noEmptyBoxes = 9
    private var winner = 0
    
    func placeMark(buttonTag: Int) -> Int{
        
        var itemToBePlaced = 0
        
        if (gameActive){
            if (playGround[buttonTag] == 0) {
                
                noEmptyBoxes = noEmptyBoxes - 1
                
                if (activePlayer == 1){
                    playGround[buttonTag] = 1
                    itemToBePlaced = 1
                    activePlayer = 2
                }
                
                else {
                    playGround[buttonTag] = 2
                    itemToBePlaced = 2
                    activePlayer = 1
                }
            }
        }
        return itemToBePlaced
    }
    
    func checkForWinning() -> Int {
        for combination in winningCombinations{
            if (playGround[combination[0]] != 0 && playGround[combination[0]] == playGround[combination[1]] && playGround[combination[0]] == playGround[combination[2]]){
                
                gameActive = false
                
                if playGround[combination[0]] == 1 {
                    winner = 1
                }
                else {
                    winner = 2

                }
            }
            
            
        }
        return winner
    }
    
    func checkForDraw() -> Bool {
        if noEmptyBoxes == 0 && winner == 0 {
            gameActive = false
            return true
        }
        return false
    }
    
    func resetGame(){
        playGround = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        activePlayer = 1
        winner = 0
        noEmptyBoxes = 9
    }
    
}
