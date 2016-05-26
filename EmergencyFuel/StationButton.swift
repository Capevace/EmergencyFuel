//
//  StationButton.swift
//  EmergencyFuel
//
//  Created by Lukas on 26.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit

class StationButton: UIButton {

    override func drawRect(rect: CGRect) {
        print("DRAWN")
        self.titleLabel?.font = UIFont.fontAwesomeOfSize(40)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = rect.width/2
    }
}
