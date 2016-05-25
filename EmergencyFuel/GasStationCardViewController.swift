//
//  GasStationCardViewController.swift
//  EmergencyFuel
//
//  Created by Lukas on 25.05.16.
//  Copyright © 2016 Mateffy. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift

class GasStationCardViewController: UIViewController {

    @IBOutlet weak var swipeableView: ZLSwipeableView!
    var stations = [GasStation]()
    var stationIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stations = GasStationService.fetch(0, longitude: 0)
                
        swipeableView.didStart = {view, location in
            print("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            print("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            print("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            print("Did cancel swiping view")
        }

    }
    
    func nextCardView () -> UIView? {
        stationIndex += 1
        if stationIndex >= stations.count {
            stationIndex = 0
        }
        
        let station = stations[stationIndex]
        let contentView = NSBundle.mainBundle().loadNibNamed("GasStationCardView", owner: self, options: nil).first! as! GasStationCardView
        contentView.titleLabel.text = station.name
        
        return contentView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
