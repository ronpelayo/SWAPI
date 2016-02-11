//
//  Film.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import Foundation
import CoreData


class Film: NSManagedObject {
    
    enum FilmFields: String {
        case Title = "title"
        case EpisodeId = "episode_id"
        case OpeningCrawl = "opening_crawl"
        case Director = "director"
        case Producer = "producer"
        case ReleaseDate = "release_date"
        case Characters = "characters"
        case Planets = "planets"
        case Starships = "starships"
        case Vehicles = "vehicles"
        case Species = "species"
    }

// Insert code here to add functionality to your managed object subclass

}
