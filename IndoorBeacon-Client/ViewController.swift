//
//  ViewController.swift
//  IndoorBeacon-Client
//
//  Created by Diaz Orona, Jesus A. on 7/19/16.
//  Copyright © 2016 Diaz Orona, Jesus A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareLocationButtonTouched(_ sender: UIButton) {
        BeaconsManager.sharedInstance.startSharingPositionUpdates()
    }

    @IBAction func stopSharingLocationButtonTouched(_ sender: UIButton) {
        BeaconsManager.sharedInstance.stopSharingPositionUpdates()        
    }
}

