//
//  ViewController.swift
//  tic
//
//  Created by Khaled  on 2/12/17.
//  Copyright © 2017 Khaled . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logic = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        let markToBePlaced = logic.placeMark(buttonTag: sender.tag - 1)
        
        if markToBePlaced != 0 {
            if markToBePlaced == 1 {
                sender.setTitle("X", for: [])
            } else {
                sender.setTitle("O", for: [])
            }
        }
        
        
        let winner = logic.checkForWinning()
        if winner == 0 {
            if (logic.checkForDraw()){
                playAgain.isHidden = false
                resultLabel.text = "It is a draw!"
                resultLabel.isHidden = false
            }
        }else {
            playAgain.isHidden = false
            resultLabel.isHidden = false
            resultLabel.text = "Player \(winner) has won"
            
        }
    }
    
        @IBOutlet weak var playAgain: UIButton!
        @IBOutlet weak var resultLabel: UILabel!
        @IBAction func playAgainTouched(_ sender: UIButton) {
            
            logic.resetGame()
            playAgain.isHidden = true
            resultLabel.isHidden = true
            for i in 1...9 {
                let button  = view.viewWithTag(i) as! UIButton
                button.setTitle(" ", for: [])
            }
        }
        
}
