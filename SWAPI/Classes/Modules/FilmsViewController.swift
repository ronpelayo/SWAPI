//
//  FilmsViewController.swift
//  SWAPI
//
//  Created by Ron Pelayo on 12/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmDetails: UILabel!
    var film : Film!
    override func viewDidLoad() {
        super.viewDidLoad()
        filmDetails.text = "Title: \(film.title!)\n"
        filmDetails.text! += "Episode ID: \(film.episode_id)\n"
        filmDetails.text! += "Opening Crawl: \(film.opening_crawl!)\n"
        filmDetails.text! += "Director: \(film.director!)\n"
        filmDetails.text! += "Producer: \(film.producer!)\n"
        filmDetails.text! += "Release Date: \(film.release_date!)\n"
        filmDetails.text! += "Characters: \(film.characters!)\n"
        filmDetails.text! += "Planets: \(film.planets!)\n"
        filmDetails.text! += "Starships: \(film.starships!)\n"
        filmDetails.text! += "Vehicles: \(film.vehicles!)\n"
        filmDetails.text! += "Species: \(film.species!)\n"
        
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
