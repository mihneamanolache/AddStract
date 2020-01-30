//
//  NewBingoGameViewController.swift
//  AddStract
//
//  Created by Mihnea on 08/01/2019.
//  Copyright © 2019 MihneaManolache. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewBingoGameViewController: UIViewController, GADRewardBasedVideoAdDelegate {

    override var prefersStatusBarHidden: Bool {
        return true
    }
        
    let vc = NewBingoGameViewController()
    var yourScore: Int = 0
    var rewardBasedAd: GADRewardBasedVideoAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newGameButton(_ sender: Any)
    {
        if rewardBasedAd.isReady {
            rewardBasedAd.present(fromRootViewController: self)
        } else {
            performSegue(withIdentifier: "backToBingoGame", sender: self)
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
        performSegue(withIdentifier: "backToBingoGame", sender: self)
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        performSegue(withIdentifier: "backToBingoGame", sender: self)
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
