//
//  MainViewController.swift
//  AddStract
//
//  Created by Mihnea on 28/12/2018.
//  Copyright © 2018 MihneaManolache. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainViewController: UIViewController
    {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBOutlet weak var anotherAdBanner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        anotherAdBanner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        anotherAdBanner.rootViewController = self
        anotherAdBanner.load(GADRequest())
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
