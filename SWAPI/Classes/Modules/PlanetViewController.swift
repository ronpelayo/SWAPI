//
//  PlanetViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class PlanetViewController: UIViewController {

    @IBOutlet weak var planetDetails: UILabel!
    
    var planet : Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetDetails.text = "Name: \(planet.name!)\n"
        planetDetails.text! += "Rotation Period: \(planet.rotation_period)\n"
        planetDetails.text! += "Orbital Period: \(planet.orbital_period)\n"
        planetDetails.text! += "Diameter: \(planet.diameter)\n"
        planetDetails.text! += "Climate: \(planet.climate!)\n"
        planetDetails.text! += "Gravity: \(planet.gravity!)\n"
        planetDetails.text! += "Terrain: \(planet.terrain!)\n"
        planetDetails.text! += "Surface Water: \(planet.surface_water)\n"
        planetDetails.text! += "Population: \(planet.population)\n"
        planetDetails.text! += "Residents: \(planet.residents!)\n"
        planetDetails.text! += "Films: \(planet.films!)\n"
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
