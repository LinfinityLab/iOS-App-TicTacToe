//
//  ViewController.swift
//  TicTacToe
//
//  Created by Weifan Lin on 2/27/16.
//  Copyright © 2016 Weifan Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var buttonList : [UIButton] = []

    var activePlayer = 1  // 1=cross, 2=nought
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameOver = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        msgLabel.text = ""
        
        playAgainButton.hidden = true
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var button : UIButton
        
        if gameState[sender.tag] == 0 && gameOver == false {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                image = UIImage(named: "cross.png")!
                
                sender.setImage(image, forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                image = UIImage(named: "nought.png")!
                
                sender.setImage(image, forState: .Normal)
                
                activePlayer = 1
            }
            
            for c in winningCombinations {
                
                if gameState[c[0]] != 0 && gameState[c[0]] == gameState[c[1]] && gameState[c[1]] == gameState[c[2]] {
                    
                    for i in c {
                        button = view.viewWithTag(i) as! UIButton
                        button.backgroundColor = UIColor(red: 255.0/255.0, green: 81.0/255.0, blue: 85.0/255.0, alpha: 1.0)
                    }
                    
                    gameOver = true
                    
                    playAgainButton.hidden = false
                    
                    if gameState[c[0]] == 1 {
                        msgLabel.text = "Crosses Has Won!!"
                    } else {
                        msgLabel.text = "Noughts Has Won!!"
                    }
                }
            }
        }
    }


    @IBAction func playAgainAction(sender: AnyObject) {
        
        activePlayer = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        gameOver = false
        
        msgLabel.text = ""
        
        playAgainButton.hidden = true
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton
            
            button.backgroundColor = nil
            button.setImage(nil, forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

