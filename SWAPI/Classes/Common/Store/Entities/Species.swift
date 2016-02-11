//
//  Species.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import Foundation
import CoreData


class Species: NSManagedObject {
    
    enum SpeciesFields: String {
        case Name = "name"
        case Classification = "classification"
        case Designation = "designation"
        case AverageHeight = "average_height"
        case SkinColors = "skin_colors"
        case HairColors = "hair_colors"
        case EyeColors = "eye_colors"
        case AverageLifespan = "average_lifespan"
        case Homeworld = "homeworld"
        case Language = "language"
        case People = "people"
        case Films = "films"
    }
// Insert code here to add functionality to your managed object subclass

}
