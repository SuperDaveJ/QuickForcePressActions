//
//  ViewController.swift
//  QuickForcePressActions
//
//  Created by Dave Johnson on 11/6/17.
//  Copyright © 2017 Paycom. All rights reserved.
//

import UIKit
import CoreTelephony

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Quick Actions Menu
        QuickActions.setUp()
        
        // Setup the Network Info and create a CTCarrier object
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        
        // Get carrier name
        let carrierName = carrier?.carrierName
        if carrierName == nil {
            print("No Carrier Network")
        } else {
            print(carrierName!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

