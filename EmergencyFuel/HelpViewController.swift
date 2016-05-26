//
//  HelpViewController.swift
//  EmergencyFuel
//
//  Created by Lukas on 26.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import ChameleonFramework

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.makeTransparent()
        self.setThemeUsingPrimaryColor(LMColors.primaryColor, withSecondaryColor: LMColors.backgroundPrimary, andContentStyle: .Contrast)
        self.view.backgroundColor = LMColors.topToBottom(LMColors.primaryColor, bottom: LMColors.primaryColor.darkenByPercentage(0.05), frame: self.view.frame)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: ContrastColorOf(LMColors.primaryColor, returnFlat: true)]
    }

    @IBAction func dismissButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
