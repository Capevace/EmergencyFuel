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
        
        
//        self.presentViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("gasStationList"), animated: true, completion: nil)
        self.performSegueWithIdentifier("goToGasStationView", sender: nil)
        emergencyButton.unpress()
    }
    
    let transition = BubbleTransition()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = emergencyButton.center
        transition.bubbleColor = emergencyButton.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = emergencyButton.center
        transition.bubbleColor = emergencyButton.backgroundColor!
        return transition
    }
}
