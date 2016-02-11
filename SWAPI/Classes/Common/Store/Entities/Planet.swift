//
//  Planet.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import Foundation
import CoreData


class Planet: NSManagedObject {
    
    enum PlanetFields: String{
        case Name = "name"
        case RotationPeriod = "rotation_period"
        case OrbitalPeriod = "orbital_period"
        case Diameter = "diameter"
        case Climate = "climate"
        case Gravity = "gravity"
        case Terrain = "terrain"
        case SurfaceWater = "surface_water"
        case Population = "population"
        case Residents = "residents"
        case Films = "films"
    }

// Insert code here to add functionality to your managed object subclass

}
