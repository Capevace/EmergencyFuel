//
//  GasStation.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit

class GasStation: NSObject {

    var name: String = ""
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var distance: Float = 0.0
    var open: Bool = false
    var price: GasPrice = GasPrice(diesel: 0.0)
    
    init(name: String) {
        self.name = name
    }
    
    override init () {
        super.init()
    }
    
}
