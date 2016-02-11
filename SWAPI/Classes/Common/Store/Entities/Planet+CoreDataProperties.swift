//
//  Planet+CoreDataProperties.swift
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

extension Planet {

    @NSManaged var name: String?
    @NSManaged var rotation_period: Double
    @NSManaged var orbital_period: Double
    @NSManaged var diameter: Double
    @NSManaged var climate: String?
    @NSManaged var gravity: String?
    @NSManaged var terrain: String?
    @NSManaged var surface_water: Double
    @NSManaged var population: Double
    @NSManaged var residents: String?
    @NSManaged var films: String?

}
