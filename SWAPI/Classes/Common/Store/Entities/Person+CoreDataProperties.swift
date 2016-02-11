//
//  Person+CoreDataProperties.swift
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

extension Person {

    @NSManaged var name: String?
    @NSManaged var height: Double
    @NSManaged var mass: Double
    @NSManaged var hair_color: String?
    @NSManaged var skin_color: String?
    @NSManaged var eye_color: String?
    @NSManaged var birth_year: String?
    @NSManaged var gender: String?
    @NSManaged var home_world: String?
    @NSManaged var films: String?
    @NSManaged var species: String?
    @NSManaged var vehicles: String?
    @NSManaged var starships: String?

}
