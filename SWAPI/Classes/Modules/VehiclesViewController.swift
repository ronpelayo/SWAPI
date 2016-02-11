//
//  VehiclesViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class VehiclesViewController: UIViewController {

    @IBOutlet weak var vehicleDetails: UILabel!
    var vehicle : Vehicle!
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicleDetails.text = "Name: \(vehicle.name!)\n"
        vehicleDetails.text! += "Model: \(vehicle.model!)\n"
        vehicleDetails.text! += "Manufacturer: \(vehicle.manufacturer!)\n"
        vehicleDetails.text! += "Cost In Credits: \(vehicle.cost_in_credits)\n"
        vehicleDetails.text! += "Length: \(vehicle.length)\n"
        vehicleDetails.text! += "Max Atmosphering Speed: \(vehicle.max_atmosphering_speed)\n"
        vehicleDetails.text! += "Crew: \(vehicle.crew)\n"
        vehicleDetails.text! += "Passengers: \(vehicle.passengers)\n"
        vehicleDetails.text! += "Cargo Capacity: \(vehicle.cargo_capacity)\n"
        vehicleDetails.text! += "Consumables: \(vehicle.consumables!)\n"
        vehicleDetails.text! += "Vehicle Class: \(vehicle.vehicle_class!)\n"
        vehicleDetails.text! += "Pilots: \(vehicle.pilots!)\n"
        vehicleDetails.text! += "Films: \(vehicle.films!)\n"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
