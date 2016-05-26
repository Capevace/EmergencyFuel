//
//  StationSelectViewController.swift
//  EmergencyFuel
//
//  Created by Lukas on 26.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import ChameleonFramework

class StationSelectViewController: UIViewController {

    var stations = [GasStation]()
    var stationIndex = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceTitleLabel: UILabel!
    @IBOutlet weak var distanceValueLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var timeValueLabel: UILabel!
    
    @IBOutlet weak var acceptButton: StationButton!
    @IBOutlet weak var skipButton: StationButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make nav bar transparent
        self.navigationController?.makeTransparent()
        
        // Setup theme for view
        self.setThemeUsingPrimaryColor(LMColors.primaryColor, withSecondaryColor: LMColors.backgroundPrimary, andContentStyle: .Contrast)
        self.view.backgroundColor = LMColors.topToBottom(LMColors.primaryColor, bottom: LMColors.primaryColor.darkenByPercentage(0.05), frame: self.view.frame)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: ContrastColorOf(LMColors.primaryColor, returnFlat: true)]
        
        self.acceptButton.setTitle(String.fontAwesomeIconWithName(.Check), forState: .Normal)
        self.skipButton.setTitle(String.fontAwesomeIconWithName(.Times), forState: .Normal)
        
        self.distanceTitleLabel.font = UIFont.fontAwesomeOfSize(self.distanceTitleLabel.font.pointSize)
        self.distanceTitleLabel.text = String.fontAwesomeIconWithName(.MapMarker)
        self.timeTitleLabel.font = UIFont.fontAwesomeOfSize(self.timeTitleLabel.font.pointSize)
        self.timeTitleLabel.text = String.fontAwesomeIconWithName(.ClockO)
    }
    
    func nextStation() {
        self.stationIndex += 1
        
        if self.stationIndex >= self.stations.count {
            self.stationIndex = 0
        }
        
        if self.stations.count == 0 {
            self.presentStation(-1)
        } else {
            self.presentStation(self.stationIndex)
        }
    }
    
    func previousStation() {
        self.stationIndex -= 1
        
        if self.stationIndex < 0 {
            self.stationIndex = 0
        }
        
        if self.stations.count == 0 {
            self.presentStation(-1)
        } else {
            self.presentStation(self.stationIndex)
        }
    }
    
    func presentStation(index: Int) {
        if index == -1 {
            // Empty
        }
        
        let station = self.stations[index]
        nameLabel.text = station.name
        
    }
    
    @IBAction func dismissControllerAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
