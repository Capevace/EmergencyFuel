//
//  EmergencyButton.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit

class EmergencyButton: UIButton {
    
    var wasPressed: Bool = false
    
    func press() {
        if (wasPressed) {
            return;
        }
        
        wasPressed = true;
        
        self.backgroundColor = UIColor.redColor()
    }
    
    func unpress() {
        if (!wasPressed) {
            return;
        }
        
        wasPressed = false;
        
        self.backgroundColor = UIColor.blueColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
