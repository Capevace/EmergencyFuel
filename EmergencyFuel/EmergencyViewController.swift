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
import BubbleTransition

class EmergencyViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var emergencyButton: EmergencyButton!
    
    override func viewDidLoad() {
        
        // Define FontAwesome font attributes
        let barButtonAttributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)]
        
        // Put buttons on bar
        self.navigationItem.leftBarButtonItem!.setTitleTextAttributes(barButtonAttributes, forState: .Normal)
        self.navigationItem.leftBarButtonItem!.title = String.fontAwesomeIconWithName(.QuestionCircle)
        
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes(barButtonAttributes, forState: .Normal)
        self.navigationItem.rightBarButtonItem!.title = String.fontAwesomeIconWithName(.Cog)
        
        self.setBackground()
        
        // Makes the UINavigationBar trasparent to be better with background of view
        self.navigationController?.makeTransparent()
    }
    
    func setBackground() {
        self.setThemeUsingPrimaryColor(LMColors.backgroundPrimary, withSecondaryColor: LMColors.primaryColor, andContentStyle: .Contrast)
        
        // Set background gradient
        self.view.backgroundColor = LMColors.topToBottom(LMColors.backgroundPrimary, bottom: LMColors.backgroundSecondary, frame: self.view.frame)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    @IBAction func helpButtonPressed(sender: UIBarButtonItem!) {
        self.performSegueWithIdentifier("toHelpViewController", sender: nil)
        transition.startingPoint = CGPoint(x: 25, y: 40)
    }
    
    @IBAction func settingsButtonPressed(sender: UIBarButtonItem!) {
        self.performSegueWithIdentifier("toSettingsViewController", sender: nil)
        transition.startingPoint = CGPoint(x: self.view.frame.width-25, y: 40)
    }
    
    @IBAction func emergencyButtonPressed(sender: UIButton!) {
        
        emergencyButton.press(true)
        
        let data = GasStationService.fetch(0.0, longitude: 0.0)
        
        self.performSegueWithIdentifier("toStationPageViewController", sender: data)
        transition.startingPoint = emergencyButton.center
        
        emergencyButton.unpress()
    }
    
    let transition = BubbleTransition()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
        
        if segue.identifier == "toStationPageViewController" {
//            let data = sender as! [GasStation]
//            let stationController = controller as! StationPageViewController
//            stationController.stations = data
        }
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.bubbleColor = LMColors.topToBottom(LMColors.primaryColor, bottom: LMColors.primaryColor.darkenByPercentage(0.05), frame: self.view.frame)
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.setBackground()

        print("transback")
        transition.transitionMode = .Dismiss
        transition.bubbleColor = LMColors.topToBottom(LMColors.primaryColor, bottom: LMColors.primaryColor.darkenByPercentage(0.2), frame: self.view.frame)
        return transition
    }
}
