//
//  Film+CoreDataProperties.swift
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

extension Film {

    @NSManaged var title: String?
    @NSManaged var episode_id: Double
    @NSManaged var opening_crawl: String?
    @NSManaged var director: String?
    @NSManaged var producer: String?
    @NSManaged var release_date: String?
    @NSManaged var characters: String?
    @NSManaged var planets: String?
    @NSManaged var starships: String?
    @NSManaged var vehicles: String?
    @NSManaged var species: String?

}
