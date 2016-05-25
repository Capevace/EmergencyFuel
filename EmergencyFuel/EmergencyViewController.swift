//
//  EmergencyViewController.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import ChameleonFramework
import FontAwesome_swift

class EmergencyViewController: UIViewController {

    @IBOutlet weak var emergencyButton: EmergencyButton!
    
    override func viewDidLoad() {
        emergencyButton.addTarget(self, action: #selector(self.emergencyButtonPressed(_:)), forControlEvents: .TouchUpInside)
        
        let barButtonAttributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)]
        
        let helpBarButton = UIBarButtonItem(title: String.fontAwesomeIconWithName(.QuestionCircle), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.pressed))
        helpBarButton.setTitleTextAttributes(barButtonAttributes, forState: .Normal)
        
        let settingsBarButton = UIBarButtonItem(title: String.fontAwesomeIconWithName(.Cog), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.pressed))
        settingsBarButton.setTitleTextAttributes(barButtonAttributes, forState: .Normal)
        
        self.navigationItem.leftBarButtonItem = helpBarButton
        self.navigationItem.rightBarButtonItem = settingsBarButton
        
        self.view.backgroundColor = LMColors.topToBottom(LMColors.backgroundPrimary, bottom: LMColors.backgroundSecondary, frame: self.view.frame)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true;
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
    }
    
    func pressed() {
        print("PRESSED")
    }
    
    func emergencyButtonPressed(sebder: UIButton!) {
        NSLog("EMERGENCY!");
        
        emergencyButton.press(true)
        
        
        for s in GasStationService.fetch(0.0, longitude: 0.0) {
            NSLog("Station \(s.name) is \(s.distance) meters away.")
        }
    }
}
