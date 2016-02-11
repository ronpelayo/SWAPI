//
//  Vehicle.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import Foundation
import CoreData


class Vehicle: NSManagedObject {
    
    enum VehicleFields: String {
        case Name = "name"
        case Model = "model"
        case Manufacturer = "manufacturer"
        case CostInCredits = "cost_in_credits"
        case Length = "length"
        case MaxAtmospheringSpeed = "max_atmosphering_speed"
        case Crew = "crew"
        case Passengers = "passengers"
        case CargoCapacity = "cargo_capacity"
        case Consumables = "consumables"
        case VehicleClass = "vehicle_class"
        case Pilots = "pilots"
        case Films = "films"
    }

// Insert code here to add functionality to your managed object subclass

}
