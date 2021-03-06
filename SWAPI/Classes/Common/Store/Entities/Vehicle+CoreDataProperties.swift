//
//  Vehicle+CoreDataProperties.swift
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

extension Vehicle {

    @NSManaged var name: String?
    @NSManaged var model: String?
    @NSManaged var manufacturer: String?
    @NSManaged var cost_in_credits: Double
    @NSManaged var length: Double
    @NSManaged var max_atmosphering_speed: Double
    @NSManaged var crew: Double
    @NSManaged var passengers: Double
    @NSManaged var cargo_capacity: Double
    @NSManaged var consumables: String?
    @NSManaged var vehicle_class: String?
    @NSManaged var pilots: String?
    @NSManaged var films: String?

}
