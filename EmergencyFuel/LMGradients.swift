//
//  LMGradients.swift
//  EmergencyFuel
//
//  Created by Lukas on 25.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import Foundation
import ChameleonFramework

class LMColors {
    
    static var backgroundPrimary = FlatBlue()
    static let primaryColor = ContrastColorOf(LMColors.backgroundPrimary, returnFlat: true)
    static let backgroundSecondary = LMColors.backgroundPrimary.darkenByPercentage(0.2)
    static let buttonTextColor = LMColors.backgroundPrimary
    static let borderColor = LMColors.backgroundPrimary.darkenByPercentage(0.3)
    
    static func topToBottom(top: UIColor, bottom: UIColor, frame: CGRect) -> UIColor {
        return UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: frame, andColors: [top, bottom])
    }
}