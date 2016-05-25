//
//  FoundStationsViewController.swift
//  
//
//  Created by Lukas on 23.05.16.
//
//

import UIKit

class GasStationListViewController : UITableViewController {

    var stations: [GasStation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stations = GasStationService.fetch(0, longitude: 0);
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : GasStationCell! = tableView.dequeueReusableCellWithIdentifier("gasStationCell", forIndexPath: indexPath) as? GasStationCell
        let station = stations[indexPath.row]
        
        cell.nameLabel.text = station.name
        cell.distanceLabel.text = "\(station.distance) m"
        cell.priceLabel.text = "\(NSString(format: "%.2f", station.price.diesel)) €"
        
        return cell
    }
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
