//
//  SpeciesViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class SpeciesViewController: UIViewController {

    @IBOutlet weak var speciesDetails: UILabel!
    var species: Species!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speciesDetails.text = "Name: \(species.name!)\n"
        speciesDetails.text! += "Classification: \(species.classification!)\n"
        speciesDetails.text! += "Designation: \(species.designation!)\n"
        speciesDetails.text! += "Average Height: \(species.average_height)\n"
        speciesDetails.text! += "Skin Colors: \(species.skin_colors!)\n"
        speciesDetails.text! += "Hair Colors: \(species.hair_colors!)\n"
        speciesDetails.text! += "Eye Colors: \(species.eye_colors!)\n"
        speciesDetails.text! += "Average Lifespan: \(species.average_lifespan!)\n"
        speciesDetails.text! += "Homeworld: \(species.homeworld!)\n"
        speciesDetails.text! += "Language: \(species.language!)\n"
        speciesDetails.text! += "People: \(species.people!)\n"
        speciesDetails.text! += "Films: \(species.films!)\n"
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
