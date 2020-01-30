//
//  BingoViewController.swift
//  AddStract
//
//  Created by Mihnea on 04/01/2019.
//  Copyright © 2019 MihneaManolache. All rights reserved.
//

import UIKit
import QuartzCore
import GoogleMobileAds

class BingoViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // ------- OUTLETS -------- //
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var numbersLabelOne: UILabel!
    @IBOutlet weak var numbersLabelTwo: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // ------- GLOBAL VARIABLES ------- //
    
    var score: Int = 1
    var result:Int = 0
    var timer:Timer?
    var seconds:Int = 60
    var selectedResult: Int = 0
    

    // ------ POSSIBLE NUMBERS LABELS ------- //
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        // labelDesign()
        setRandomNumber()
        randomEcuationFunction()
        swichNumbers()
        checkResults()
        updateScoreLabel()
    
        // Do any additional setup after loading the view.
        
        // ------- TAPPABLE LABELS -------- //
        
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionOne))
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionTwo))
        
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionThree))
        
        let tapFour = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionFour))
        
        let tapFive = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionFive))
        
        let tapSix = UITapGestureRecognizer(target: self, action: #selector(BingoViewController.tapFunctionSix))
        
        labelOne.isUserInteractionEnabled = true
        labelOne.addGestureRecognizer(tapOne)
        
        labelTwo.isUserInteractionEnabled = true
        labelTwo.addGestureRecognizer(tapTwo)
        
        labelThree.isUserInteractionEnabled = true
        labelThree.addGestureRecognizer(tapThree)
        
        labelFour.isUserInteractionEnabled = true
        labelFour.addGestureRecognizer(tapFour)
        
        labelFive.isUserInteractionEnabled = true
        labelFive.addGestureRecognizer(tapFive)
        
        labelSix.isUserInteractionEnabled = true
        labelSix.addGestureRecognizer(tapSix)
        
        
    }
    
    // ------ LABEL DESIGN ------ //
    
   
    
//    func labelDesign() {
//        // label 1 //
//
//        labelOne.textColor = UIColor.white
//        labelOne.textAlignment = .center
//
//        labelOne.backgroundColor = UIColor(patternImage: UIImage(named: "NEW-BINGO-LABEL")!)
//
//
//        // label 2//
//        labelTwo.textColor = UIColor.white
//        labelTwo.textAlignment = .center
//
//        labelTwo.backgroundColor = UIColor(patternImage: UIImage(named: "NEW-BINGO-LABEL")!)
//
//
//        // label 3 //
//        labelThree.textColor = UIColor.white
//        labelThree.textAlignment = .center
//
//        labelThree.backgroundColor = UIColor(patternImage: UIImage(named: "NEW-BINGO-LABEL")!)
//
//
//        // label 4 //
//        labelFour.textColor = UIColor.white
//        labelFour.textAlignment = .center
//
//        labelFour.backgroundColor = UIColor(patternImage: UIImage(named: "NEW-BINGO-LABEL")!)
//
//    }
    
    
    // ------- LABEL ACTION ON TAP ------- //
    
    @objc func tapFunctionOne(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelOne.text!)!

        print(selectedResult)
        
        checkResults()
        updateScoreLabel()
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }

    }
    
    @objc func tapFunctionTwo(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelTwo.text!)!
        
        print(selectedResult)
        
        checkResults()
        updateScoreLabel()
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    @objc func tapFunctionThree(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelThree.text!)!
        
        print(selectedResult)
        
        checkResults()
        updateScoreLabel()
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    @objc func tapFunctionFour(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelFour.text!)!
        
        print(selectedResult)
        
        checkResults()
        
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    @objc func tapFunctionFive(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelFive.text!)!
        
        print(selectedResult)
        
        checkResults()
        
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    @objc func tapFunctionSix(sender:UITapGestureRecognizer) {
        
        selectedResult = Int(labelSix.text!)!
        
        print(selectedResult)
        
        checkResults()
        
        
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(onUpdateTimer), userInfo:nil, repeats:true)
        }
        
    }
    
    func swichNumbers() {
        
        calculatorPrincipal()
        
        var tappNumber:Int = Int(arc4random_uniform(7))
        
        let ranNumOne = arc4random_uniform(1999)
        let ranNumTwo = arc4random_uniform(1999)
        let ranNumThree = arc4random_uniform(1999)
        let ranNumFour = arc4random_uniform(1999)
        let ranNumFive = arc4random_uniform(1999)
        let ranNumSix = arc4random_uniform(1999)
        
        switch tappNumber {
        case 1:
            labelOne.text = "\(result)"
            labelTwo.text = "\(ranNumTwo)"
            labelThree.text = "\(ranNumThree)"
            labelFour.text = "\(ranNumFour)"
            labelFive.text = "\(ranNumFive)"
            labelSix.text = "\(ranNumSix)"
            
        case 2:
            labelOne.text = "\(ranNumOne)"
            labelTwo.text = "\(result)"
            labelThree.text = "\(ranNumThree)"
            labelFour.text = "\(ranNumFour)"
            labelFive.text = "\(ranNumFive)"
            labelSix.text = "\(ranNumSix)"
            
        case 3:
            labelOne.text = "\(ranNumOne)"
            labelTwo.text = "\(ranNumTwo)"
            labelThree.text = "\(result)"
            labelFour.text = "\(ranNumFour)"
            labelFive.text = "\(ranNumFive)"
            labelSix.text = "\(ranNumSix)"
            
        case 4:
            labelOne.text = "\(ranNumOne)"
            labelTwo.text = "\(ranNumTwo)"
            labelThree.text = "\(ranNumThree)"
            labelFour.text = "\(result)"
            labelFive.text = "\(ranNumFive)"
            labelSix.text = "\(ranNumSix)"
            
        case 5:
            labelOne.text = "\(ranNumOne)"
            labelTwo.text = "\(ranNumTwo)"
            labelThree.text = "\(ranNumThree)"
            labelFour.text = "\(ranNumFour)"
            labelFive.text = "\(result)"
            labelSix.text = "\(ranNumSix)"
        default:
            labelOne.text = "\(ranNumOne)"
            labelTwo.text = "\(ranNumTwo)"
            labelThree.text = "\(ranNumThree)"
            labelFour.text = "\(ranNumFour)"
            labelFive.text = "\(ranNumFive)"
            labelSix.text = "\(result)"
        }
    }

 ///////////////////////////////////////////////////////////////////////////
    
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
    
    func calculatorPrincipal() -> Int
    {
        // ------- VARIABLES ------- //
        let numberOne_text = numbersLabelOne?.text
        let numberTwo_text = numbersLabelTwo?.text
        let numberOne = Int(numberOne_text!)
        let numberTwo = Int(numberTwo_text!)
        let operation = operationLabel?.text
        
        // ------- GET THE RESULT ------- //
        if operation == "+"
        {
            result = Int(numberOne! + numberTwo!)
        }
        else  if  operation == "-"
        {
            result = Int(numberOne! - numberTwo!)
        }
        
        return result
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
                
                performSegue(withIdentifier: "BingoOverSegue", sender: self)
                
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

    // ------- CHECK RESULTS -------//
    
    func checkResults(){
        
        calculatorPrincipal()
        
        print("result is:", result)
        print("selected result is:", selectedResult)
        
        if selectedResult == result
            {
                score += 1
            }
            else {
                print("Incorrect!")
                score -= 1
            }
        
        // ------- UPDATE GAME ------- //
        
        setRandomNumber()
        randomEcuationFunction()
        swichNumbers()
        updateScoreLabel()
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
}


