//
//  NewGameViewController.swift
//  AddStract
//
//  Created by Mihnea on 28/12/2018.
//  Copyright © 2018 MihneaManolache. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewGameViewController: UIViewController, GADRewardBasedVideoAdDelegate{
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    let vc = GameViewController()
    var yourScore: Int = 0
    var rewardBasedAd: GADRewardBasedVideoAd!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("highscore was:" )
        
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")

    }
    
    @IBAction func newGameButton(_ sender: Any)
    {
        if rewardBasedAd.isReady {
            rewardBasedAd.present(fromRootViewController: self)
        } else {
            performSegue(withIdentifier: "backToGame", sender: self)
        }
    }
    
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad has completed.")
        performSegue(withIdentifier: "backToGame", sender: self)
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        performSegue(withIdentifier: "backToGame", sender: self)
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }

}
