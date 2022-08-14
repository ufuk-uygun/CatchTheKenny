//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by ufuk on 14.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var score:Int=0
    var highScore:Int=0
    var positionIndex:Int=0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet var starButtons: [UIButton]!
    @IBAction func starButtonTapped(_ sender: UIButton) {
       
        score = score + 1
        
        scoreLabel.text="Score:\(score)"
        
        saveHighScore()
                             
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //read highScore from userDefaults
        let hs =  UserDefaults.standard.object(forKey: "highScore")
        
        if let hs = hs as? Int{
            highScore=hs
            refreshHighScore()
             
        }
        
        hiddenAllItems()
       
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTime() {
        showItems()
    }
    
    
    func hiddenAllItems(){
        
        for button in starButtons{
               
            button.isHidden=true
        }
    }
    
    func showItems(){
        
        hiddenAllItems()
        
        let randomInt = Int.random(in: 0..<16)
        
        for button in starButtons{
            
            if (button.tag == randomInt)
            {
                button.isHidden=false
            }
                
        }
              
    }
    
    

    @IBAction func restHighScoreTapped(_ sender: Any) {
   
        
    let hs = UserDefaults.standard.object(forKey: "highScore")
    
       if hs is Int? {
           UserDefaults.standard.removeObject(forKey: "highScore")
           
           score = 0
           highScore=0
           
           refreshHighScore()
       }
             
    }
    
    func saveHighScore(){
        
        if (score>highScore){
            UserDefaults.standard.set(score, forKey: "highScore")
            
            highScore = score
            
            refreshHighScore()
            
        }
        
    }
    
    
    func refreshHighScore() {
        
        scoreLabel.text="Score:\(score)"
        highScoreLabel.text = "HS:\(highScore)"
    }
     

}

