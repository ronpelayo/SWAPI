//
//  PersonViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class PersonViewController: UIViewController {
    
    @IBOutlet weak var personDetails: UILabel!
    
    var person : Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        personDetails.text = "Name: \(person.name!)\n"
        personDetails.text! += "Height: \(person.height)\n"
        personDetails.text! += "Mass: \(person.mass)\n"
        personDetails.text! += "Hair Color: \(person.hair_color!)\n"
        personDetails.text! += "Skin Color: \(person.skin_color!)\n"
        personDetails.text! += "Eye Color: \(person.eye_color!)\n"
        personDetails.text! += "Birth Year: \(person.birth_year!)\n"
        personDetails.text! += "Gender: \(person.gender!)\n"
        personDetails.text! += "Homeworld: \(person.home_world!)\n"
        personDetails.text! += "Films: \(person.films!)\n"
        personDetails.text! += "Species: \(person.species!)\n"
        personDetails.text! += "Vehicles: \(person.vehicles!)\n"
        personDetails.text! += "Starships: \(person.starships!)\n"
        
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
