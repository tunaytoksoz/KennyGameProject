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
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    var random = 0
    var timer = Timer()
    var timer1 = Timer()
    var timeCounter = 0
    var score = 0
    var HighScore = 0
    var imageViews = [UIImageView]()

    func timersStart(){
        timeLabel.text = "10"
        timeCounter = 10
        score = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunction), userInfo: nil, repeats: true)
        timer1 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(randomGenerator), userInfo: nil, repeats: true)
        scoreLabel.text = "Skor: \(score)"
    }
    
    func alert(title: String, message: String){
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        let replay = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
            self.timersStart()        }
        alert.addAction(ok)
        alert.addAction(replay)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HighScore = UserDefaults.standard.integer(forKey: "highScore")
        highScoreLabel.text = "\(HighScore)"
        
        imageView1.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true
        
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(scoreUp))
        
        imageView1.addGestureRecognizer(gestureRecognizer1)
        imageView2.addGestureRecognizer(gestureRecognizer2)
        imageView3.addGestureRecognizer(gestureRecognizer3)
        imageView4.addGestureRecognizer(gestureRecognizer4)
        imageView5.addGestureRecognizer(gestureRecognizer5)
        imageView6.addGestureRecognizer(gestureRecognizer6)
        imageView7.addGestureRecognizer(gestureRecognizer7)
        imageView8.addGestureRecognizer(gestureRecognizer8)
        imageView9.addGestureRecognizer(gestureRecognizer9)
        imageViews = [imageView1,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,imageView8,imageView9]
        timersStart()
    }
    
    @objc func timeFunction(){
        timeCounter = timeCounter - 1
        timeLabel.text = "\(timeCounter)"
        if timeCounter == 0 {
            timer.invalidate()
            timer1.invalidate()
            if(score >= HighScore){
                alert(title: "High Score!!!",message: "Congratulations!!! You are the Best!")
                UserDefaults.standard.set(score, forKey: "highScore")
            }
            alert(title: "Time's Up",message: "Do you want to play again?")
        }
    }
    
    @objc func randomGenerator(){
        random = Int.random(in: 0..<8)
        for imageView in imageViews {
            imageView.isHidden = true
        }
        
        imageViews[random].isHidden = false
    }
    
    @objc func scoreUp(){
        score = score + 1
        scoreLabel.text = "Skor: \(score)"
    }
    
    

    
}

