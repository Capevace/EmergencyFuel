//
//  GasStationService.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit

class GasStationService {

    static func fetch(latitude: Float, longitude: Float) -> [GasStation] {
        var stations = [GasStation]()
        
        for i in 0...9 {
            let station = GasStation(name: "My name is " + String(i))
            station.distance = Float(arc4random_uniform(10) * 20)
            station.price = GasPrice(diesel: Float(arc4random()) / Float(0x100000000))
            
            stations.append(station)
        }
        
        return stations
    }
}
