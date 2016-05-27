//
//  GasStationService.swift
//  EmergencyFuel
//
//  Created by Lukas on 22.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import Alamofire

class GasStationService {

    static func fetch(latitude: Float, longitude: Float, onCompletion: (stations: [GasStation]) -> Void) -> [GasStation] {
        var stations = [GasStation]()
        
        Alamofire.request(
            .GET,
            "https://maps.googleapis.com/maps/api/place/nearbysearch/json",
            parameters: [
                "types": "gas_station",
                "rankby": "distance",
                "location": "53.863802,10.667513",
                "language": "DE",
                "key": "AIzaSyDXbz--N-6-0q7DLKp1f9UfLGyaJuvZTCE"
            ]
        ).responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
                if let JSON = response.result.value {
                    for stationJSON in JSON["results"] {
                        let station = GasStation()
                        if let name = stationJSON["name"] {
                            station.name = name
                        }
                        
                        if let open = stationJSON["opening_hours"["open_now"] {
                            
                        }
                        
                    }
                }
        }
        
        for i in 0...9 {
            let station = GasStation(name: "My name is " + String(i))
            station.distance = Float(arc4random_uniform(10) * 20)
            station.price = GasPrice(diesel: Float(arc4random()) / Float(0x100000000))
            
            stations.append(station)
        }
        
        return stations
    }
}
