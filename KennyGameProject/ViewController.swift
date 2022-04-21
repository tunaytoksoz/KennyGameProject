//
//  ViewController.swift
//  KennyGameProject
//
//  Created by Tunay Toksöz on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    var imageView = UIImageView()
    var timer = Timer()
    var timer1 = Timer()
    var timeCounter = 0
    var score = 0
    var HighScore = 0
    var xLocations: [CGFloat] = []
    var yLocations: [CGFloat] = []
    
    
    func timersStart(){
        timeLabel.text = "10"
        timeCounter = 10
        score = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunction), userInfo: nil, repeats: true)
        timer1 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(randomGenerator), userInfo: nil, repeats: true)
        scoreLabel.text = "Score: \(score)"
        HighScore = UserDefaults.standard.integer(forKey: "highScore")
        highScoreLabel.text = "HighScore: \(HighScore)"
    }
    
    func alert(title: String, message: String){
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ UIAlertAction in
                exit(0)
        }
        let replay = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
            self.timersStart()        }
        alert.addAction(ok)
        alert.addAction(replay)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var width = view.frame.width
        var height = view.frame.height
        width = width - 50
        width = width / 3
        height = height * 0.33
       
     
        xLocations = [25.0,25.0+width,25.0+2*width]
        yLocations = [height,height+width,height+2*width]
        
        
        HighScore = UserDefaults.standard.integer(forKey: "highScore")
        highScoreLabel.text = "HighScore: \(HighScore)"
        
        imageView.isUserInteractionEnabled = true
        imageView.frame = CGRect(x: 25.0, y: height, width: width, height: width)
        imageView.image = UIImage(named: "kenny")
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        imageView.addGestureRecognizer(gestureRecognizer)
        view.addSubview(imageView)
        
        timersStart()
    }
    
    @objc func timeFunction(){
        timeCounter = timeCounter - 1
        timeLabel.text = "\(timeCounter)"
        if timeCounter == 0 {
            timer.invalidate()
            timer1.invalidate()
            if(score > HighScore){
                alert(title: "High Score!!!",message: "Congratulations!!! You are the Best!")
                UserDefaults.standard.set(score, forKey: "highScore")
                highScoreLabel.text = "HighScore: \(HighScore)"
            }
            alert(title: "Time's Up",message: "Do you want to play again?")
        }
    }
    
    @objc func randomGenerator(){
        var width = view.frame.width
        width = width - 50
        width = width / 3
       
       let randomX = Int.random(in: 0..<3)
       let randomY = Int.random(in: 0..<3)
        imageView.frame = CGRect(x: xLocations[randomX], y: yLocations[randomY], width:width , height: width)
        
    }
    
    @objc func scoreUp(){
        score = score + 1
        scoreLabel.text = "Score: \(score)"
    }
    
    

    
}

