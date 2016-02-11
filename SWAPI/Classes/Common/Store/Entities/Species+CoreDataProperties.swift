//
//  Species+CoreDataProperties.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Species {

    @NSManaged var name: String?
    @NSManaged var classification: String?
    @NSManaged var designation: String?
    @NSManaged var average_height: Double
    @NSManaged var skin_colors: String?
    @NSManaged var hair_colors: String?
    @NSManaged var eye_colors: String?
    @NSManaged var average_lifespan: String?
    @NSManaged var homeworld: String?
    @NSManaged var language: String?
    @NSManaged var people: String?
    @NSManaged var films: String?

}
