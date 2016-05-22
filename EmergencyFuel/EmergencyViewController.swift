//
//  EmergencyViewController.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit

class EmergencyViewController: UIViewController {

    @IBOutlet weak var emergencyButton: EmergencyButton!
    
    override func viewDidLoad() {
        emergencyButton.addTarget(self, action: #selector(self.emergencyButtonPressed(_:)), forControlEvents: .TouchUpInside)
    }
    
    func emergencyButtonPressed(sebder: UIButton!) {
        NSLog("EMERGENCY!");
        
        emergencyButton.press()
        
        for s in GasStationService.fetch(0.0, longitude: 0.0) {
            NSLog("Station \(s.name) is \(s.distance) meters away.")
        }
    }
    
}
