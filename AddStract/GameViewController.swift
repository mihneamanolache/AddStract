//
//  GameViewController.swift
//  AddStract
//
//  Created by Mihnea on 28/12/2018.
//  Copyright © 2018 MihneaManolache. All rights reserved.
//

import UIKit
import GoogleMobileAds

class GameViewController: UIViewController {
    
    // ------- HIDING STATUS BAR -------- //
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // ------- OUTLETS -------- //
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var numbersLabelOne: UILabel!
    @IBOutlet weak var numbersLabelTwo: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var inputLabel: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    // ------- GLOBAL VARIABLES ------- //
    
    var score: Int = 0
    var result:Double = 0.0
    var timer:Timer?
    var seconds:Int = 60
    
    var highScoreGeek: Int = 0
    var savedScore: Int = 0
    
    var highScoreDefault = UserDefaults.standard
    var savedScoreDefault = UserDefaults.standard
    
    // ------- VIEW DID LOAD ------- //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        setRandomNumber()
        randomEcuationFunction()
        updateScoreLabel()
        inputLabel.text = ""
        
    }
    

    
    // ------- UPDATE SCORE LABEL ------- //

    func updateScoreLabel()
    {
        scoreLabel?.text = "\(score)"

    }
    
    // ------- GENERATE RANDOM NUMBERS ------- //
    
    func setRandomNumber()
    {
        let ranNumOne = arc4random_uniform(999)
        
        let ranNumTwo = arc4random_uniform(999)
        
        if ranNumOne > ranNumTwo
            {
                numbersLabelOne.text = "\(ranNumOne)"
                numbersLabelTwo.text = "\(ranNumTwo)"
            }
        else
            {
                numbersLabelOne.text = "\(ranNumTwo)"
                numbersLabelTwo.text = "\(ranNumOne)"
            }
    }
    
    // ------- GENERATE RANDOM ECUATION ------- //
    
    func randomEcuationFunction()
    {
        let eccuation = ["+", "-"]
        
        let randomEccuation = eccuation.randomElement()
        
        operationLabel?.text = randomEccuation
    }
    
    // ------- GET ECUATION RESULT ------- //
    
    func calculatorPrincipal() -> Double
    {
        // ------- VARIABLES ------- //
        let numberOne_text = numbersLabelOne?.text
        let numberTwo_text = numbersLabelTwo?.text
        let numberOne = Double(numberOne_text!)
        let numberTwo = Double(numberTwo_text!)
        let operation = operationLabel?.text
        
        // ------- GET THE RESULT ------- //
        if operation == "+"
        {
            result = Double(numberOne! + numberTwo!)
        }
        else  if  operation == "-"
        {
            result = Double(numberOne! - numberTwo!)
        }
        
        return result
    }
    
    // ------- CHECK ECUATION RESULT ------- //
    
    func textFieldDidChange()
    {
        
        // ------- CHECK RESULT ------- //
        calculatorPrincipal()
        print("result is:", result)
        
        let inputResult_text = inputLabel?.text
        let inputResult = Double(inputResult_text!)
        
        if inputResult == result {
            print("Correct!")
            score += 1
            seconds += 3
        } else {
            print("Incorrect!")
            score -= 1
        }
        
        // ------- UPDATE GAME ------- //
        
        updateScoreLabel()
        setRandomNumber()
        randomEcuationFunction()
        inputLabel.text = ""
        
    // ------- timer ------- //
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    // ------- TIMER ------- //
    
    @objc func onUpdateTimer() -> Void
    {
        if(seconds > 0)
        {
            seconds -= 1
            
            updateTimeLabel()
        }
        else if(seconds == 0)
        {
            if(timer != nil)
            {
                timer!.invalidate()
                timer = nil
                
                let alertController = UIAlertController(title: "Time Up!", message: "Your time is up! You got a score of: \(score) points. Very good!", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: nil)
                alertController.addAction(restartAction)
                
                seconds = 60
                
                performSegue(withIdentifier: "gameOverSegue", sender: self)

            }
        }
    }
    
    func updateTimeLabel()
    {
        if(timeLabel != nil)
        {
            let min:Int = (seconds / 60) % 60
            let sec:Int = seconds % 60
            
            let min_p:String = String(format: "%02d", min)
            let sec_p:String = String(format: "%02d", sec)
            
            timeLabel!.text = "\(min_p):\(sec_p)"
            
            
        }
    }

    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
    
    // -------- ACTION BUTTONS -------- //
    
    @IBAction func resetInputLabel(_ sender: UIButton)
    {
        if seconds > 5
        {
            setRandomNumber()
            randomEcuationFunction()
            seconds -= 5
            updateTimeLabel()
            updateScoreLabel()
        }
    }
    
    @IBAction func checkResults(_ sender: UIButton)
    {
        textFieldDidChange()
        savedScore = score
        savedScoreDefault.setValue(savedScore, forKey: "savedScoreGeek")
        
    }
    
}
