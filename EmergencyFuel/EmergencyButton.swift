//
//  EmergencyButton.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import Ripple
import SwiftyTimer
import ChameleonFramework
import FontAwesome_swift

class EmergencyButton: UIButton {
    
    var isActive: Bool = false
    
    var spinnerLayer = CAShapeLayer()
    var spinnerPath = UIBezierPath()
    
    func press(becomeActive: Bool) {
        if (isActive) {
            return
        }
        isActive = true
        
        self.addBorder(self.frame)
        self.animateBorder(self.frame)
        self.enabled = false
        
//        ripple(self.center, view: self.superview!, duration: 2, divider: 4)
    }
    
    func unpress() {
        if (!isActive) {
            return
        }
        isActive = false
        
        self.enabled = true
        self.spinnerLayer.removeFromSuperlayer()
    }
    
    func addBorder (rect: CGRect) {
        // Create round path
        spinnerPath = UIBezierPath()
        spinnerPath.addArcWithCenter(CGPointZero, radius: (rect.size.width - 4)/2, startAngle: 0, endAngle: (1.8 * CGFloat(M_PI)) + 0, clockwise: true)
        
        // Add path to layer
        spinnerLayer = CAShapeLayer()
        spinnerLayer.frame.origin = CGPoint(x: rect.width/2, y: rect.height/2)
        spinnerLayer.path = spinnerPath.CGPath
        spinnerLayer.fillColor = UIColor.clearColor().CGColor
        spinnerLayer.strokeColor = LMColors.borderColor.CGColor
        spinnerLayer.lineWidth = 0
        
        // Add layer to UIButton view
        if spinnerLayer.superlayer != self.layer {
            self.layer.addSublayer(spinnerLayer)
        }
    }
    
    func animateBorder(rect: CGRect) {
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        spinAnimation.toValue = NSNumber(double: M_PI * 2)
        spinAnimation.duration = 2
        spinAnimation.cumulative = true
        spinAnimation.repeatCount = Float.infinity
        
        let strokeAnimation = CABasicAnimation(keyPath: "lineWidth")
        strokeAnimation.toValue = 5
        strokeAnimation.fromValue = 0
        strokeAnimation.fillMode = kCAFillModeForwards
        strokeAnimation.removedOnCompletion = false
        strokeAnimation.duration = 0.1
        
        spinnerLayer.addAnimation(spinAnimation, forKey: "rotationAnimation")
        spinnerLayer.addAnimation(strokeAnimation, forKey: "strokeAnimation")
    }
    
    override func drawRect(rect: CGRect) {
        // Making UIButton round
        self.layer.masksToBounds = true
        self.layer.cornerRadius = rect.width/2
        
        self.titleLabel?.font = UIFont.fontAwesomeOfSize(50)
        self.setTitleColor(LMColors.backgroundPrimary, forState: .Normal)
        self.setTitleColor(LMColors.backgroundPrimary, forState: .Highlighted)
        self.setTitleColor(LMColors.backgroundPrimary.colorWithAlphaComponent(0.4), forState: .Disabled)
        self.setTitle(String.fontAwesomeIconWithName(.Search), forState: .Normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
