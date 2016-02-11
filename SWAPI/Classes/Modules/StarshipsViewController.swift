//
//  StarshipsViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class StarshipsViewController: UIViewController {

    @IBOutlet weak var starshipDetails: UILabel!
    var starship : Starship!
    override func viewDidLoad() {
        super.viewDidLoad()
        starshipDetails.text = "Name: \(starship.name!)\n"
        starshipDetails.text! += "Model: \(starship.model!)\n"
        starshipDetails.text! += "Manufacturer: \(starship.manufacturer!)\n"
        starshipDetails.text! += "Cost In Credits: \(starship.cost_in_credit)\n"
        starshipDetails.text! += "Length: \(starship.length)\n"
        starshipDetails.text! += "Max Atmosphering Speed: \(starship.max_atmosphering_speed)\n"
        starshipDetails.text! += "Crew: \(starship.crew)\n"
        starshipDetails.text! += "Passengers: \(starship.passengers)\n"
        starshipDetails.text! += "Cargo Capacity: \(starship.cargo_capacity)\n"
        starshipDetails.text! += "Hyperdrive Rating: \(starship.hyperdrive_rating)\n"
        starshipDetails.text! += "MGLT: \(starship.mglt)\n"
        starshipDetails.text! += "Starship Class: \(starship.starship_class!)\n"
        starshipDetails.text! += "Piots: \(starship.pilots!)\n"
        starshipDetails.text! += "Films: \(starship.films!)\n"
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
