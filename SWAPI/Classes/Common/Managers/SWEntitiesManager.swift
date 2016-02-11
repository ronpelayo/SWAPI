//
//  SWEntitiesManager.swift
//  SWAPI
//
//  Created by Ron Pelayo on 11/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import CoreData
import SwiftyJSON

class SWEntitiesManager {
    let managedContext: NSManagedObjectContext
    
    required init(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
    }
    
    func addPerson(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = Person(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        person.name = results[Person.PersonFields.Name.rawValue].stringValue
        person.height = results[Person.PersonFields.Height.rawValue].doubleValue
        person.mass = results[Person.PersonFields.Mass.rawValue].doubleValue
        person.hair_color = results[Person.PersonFields.HairColor.rawValue].stringValue
        person.skin_color = results[Person.PersonFields.SkinColor.rawValue].stringValue
        person.eye_color = results[Person.PersonFields.EyeColor.rawValue].stringValue
        person.birth_year = results[Person.PersonFields.BirthYear.rawValue].stringValue
        person.gender = results[Person.PersonFields.Gender.rawValue].stringValue
        
        let homeworldURL = results[Person.PersonFields.Homeworld.rawValue].stringValue
        let filmsURL = results[Person.PersonFields.Films.rawValue]
        let speciesURL = results[Person.PersonFields.Species.rawValue]
        let vehiclesURL = results[Person.PersonFields.Vehicles.rawValue]
        let starshipsURL = results[Person.PersonFields.Starships.rawValue]
        
        SwApiManager().fetchSWApiSpecificValue(homeworldURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            person.home_world = response!
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(filmsURL, strKey: "title", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            person.films = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(speciesURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            person.species = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(vehiclesURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            person.vehicles = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(starshipsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            person.starships = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try person.managedObjectContext!.save()
                print("PERSON Name: \(person.name) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }
    
    
    func addPlanet(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Planet", inManagedObjectContext: managedContext)
        let planet = Planet(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        planet.name = results[Planet.PlanetFields.Name.rawValue].stringValue
        planet.rotation_period = results[Planet.PlanetFields.RotationPeriod.rawValue].doubleValue
        planet.orbital_period = results[Planet.PlanetFields.OrbitalPeriod.rawValue].doubleValue
        planet.diameter = results[Planet.PlanetFields.Diameter.rawValue].doubleValue
        planet.climate = results[Planet.PlanetFields.Climate.rawValue].stringValue
        planet.gravity = results[Planet.PlanetFields.Gravity.rawValue].stringValue
        planet.terrain = results[Planet.PlanetFields.Terrain.rawValue].stringValue
        planet.surface_water = results[Planet.PlanetFields.SurfaceWater.rawValue].doubleValue
        planet.population = results[Planet.PlanetFields.Population.rawValue].doubleValue
        
        
        let residentsURL = results[Planet.PlanetFields.Residents.rawValue]
        let filmsURL = results[Person.PersonFields.Films.rawValue]
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(residentsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            planet.residents = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(filmsURL, strKey: "title", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            planet.films = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try planet.managedObjectContext!.save()
                print("PLANET Name: \(planet.name) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }

    
    func addFilm(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Film", inManagedObjectContext: managedContext)
        let film = Film(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        film.title = results[Film.FilmFields.Title.rawValue].stringValue
        film.episode_id = results[Film.FilmFields.EpisodeId.rawValue].doubleValue
        film.opening_crawl = results[Film.FilmFields.OpeningCrawl.rawValue].stringValue
        film.director = results[Film.FilmFields.Director.rawValue].stringValue
        film.producer = results[Film.FilmFields.Producer.rawValue].stringValue
        film.release_date = results[Film.FilmFields.ReleaseDate.rawValue].stringValue
        
        
        
        let charactersURL = results[Film.FilmFields.Characters.rawValue]
        let planetsURL = results[Film.FilmFields.Planets.rawValue]
        let starshipsURL = results[Film.FilmFields.Starships.rawValue]
        let vehiclesURL = results[Film.FilmFields.Vehicles.rawValue]
        let speciesURL = results[Film.FilmFields.Species.rawValue]
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(charactersURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            film.characters = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(planetsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            film.planets = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(starshipsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            film.starships = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(vehiclesURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            film.vehicles = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(speciesURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            film.species = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try film.managedObjectContext!.save()
                print("FILM Title: \(film.title) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }
    
    func addSpecies(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Species", inManagedObjectContext: managedContext)
        let species = Species(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        species.name = results[Species.SpeciesFields.Name.rawValue].stringValue
        species.classification = results[Species.SpeciesFields.Classification.rawValue].stringValue
        species.designation = results[Species.SpeciesFields.Designation.rawValue].stringValue
        species.average_height = results[Species.SpeciesFields.AverageHeight.rawValue].doubleValue
        species.skin_colors = results[Species.SpeciesFields.SkinColors.rawValue].stringValue
        species.hair_colors = results[Species.SpeciesFields.HairColors.rawValue].stringValue
        species.eye_colors = results[Species.SpeciesFields.EyeColors.rawValue].stringValue
        species.average_lifespan = results[Species.SpeciesFields.AverageLifespan.rawValue].stringValue
        species.language = results[Species.SpeciesFields.Language.rawValue].stringValue
        
        
        
        let homeworldURL = results[Species.SpeciesFields.Homeworld.rawValue].stringValue
        let peopleURL = results[Species.SpeciesFields.People.rawValue]
        let filmsURL = results[Species.SpeciesFields.Films.rawValue]
        
        SwApiManager().fetchSWApiSpecificValue(homeworldURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            species.homeworld = response!
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(peopleURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            species.people = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(filmsURL, strKey: "title", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            species.films = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try species.managedObjectContext!.save()
                print("SPECIES Name: \(species.name) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }
    
    func addVehicle(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Vehicle", inManagedObjectContext: managedContext)
        let vehicle = Vehicle(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        vehicle.name = results[Vehicle.VehicleFields.Name.rawValue].stringValue
        vehicle.model = results[Vehicle.VehicleFields.Model.rawValue].stringValue
        vehicle.manufacturer = results[Vehicle.VehicleFields.Manufacturer.rawValue].stringValue
        vehicle.cost_in_credits = results[Vehicle.VehicleFields.CostInCredits.rawValue].doubleValue
        vehicle.length = results[Vehicle.VehicleFields.Length.rawValue].doubleValue
        vehicle.max_atmosphering_speed = results[Vehicle.VehicleFields.MaxAtmospheringSpeed.rawValue].doubleValue
        vehicle.crew = results[Vehicle.VehicleFields.Crew.rawValue].doubleValue
        vehicle.passengers = results[Vehicle.VehicleFields.Passengers.rawValue].doubleValue
        vehicle.cargo_capacity = results[Vehicle.VehicleFields.CargoCapacity.rawValue].doubleValue
        vehicle.consumables = results[Vehicle.VehicleFields.Consumables.rawValue].stringValue
        vehicle.vehicle_class = results[Vehicle.VehicleFields.VehicleClass.rawValue].stringValue
        
        
        let pilotsURL = results[Vehicle.VehicleFields.Pilots.rawValue]
        let filmsURL = results[Vehicle.VehicleFields.Films.rawValue]
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(pilotsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            vehicle.pilots = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(filmsURL, strKey: "title", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            vehicle.films = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try vehicle.managedObjectContext!.save()
                print("VEHICLE Name: \(vehicle.name) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }
    
    func addStarship(results: JSON, strDispatchGroup: dispatch_group_t){
        let tempDispatchGroup = dispatch_group_create()
        let entity = NSEntityDescription.entityForName("Starship", inManagedObjectContext: managedContext)
        let starship = Starship(entity: entity!,insertIntoManagedObjectContext: managedContext)
        
        starship.name = results[Starship.StarshipFields.Name.rawValue].stringValue
        starship.model = results[Starship.StarshipFields.Model.rawValue].stringValue
        starship.manufacturer = results[Starship.StarshipFields.Manufacturer.rawValue].stringValue
        starship.cost_in_credit = results[Starship.StarshipFields.CostInCredits.rawValue].doubleValue
        starship.length = results[Starship.StarshipFields.Length.rawValue].doubleValue
        starship.max_atmosphering_speed = results[Starship.StarshipFields.MaxAtmospheringSpeed.rawValue].doubleValue
        starship.crew = results[Starship.StarshipFields.Crew.rawValue].doubleValue
        starship.passengers = results[Starship.StarshipFields.Passengers.rawValue].doubleValue
        starship.cargo_capacity = results[Starship.StarshipFields.CargoCapacity.rawValue].doubleValue
        starship.consumables = results[Starship.StarshipFields.Consumables.rawValue].stringValue
        starship.hyperdrive_rating = results[Starship.StarshipFields.HyperdriveRating.rawValue].doubleValue
        starship.mglt = results[Starship.StarshipFields.MGLT.rawValue].doubleValue
        starship.starship_class = results[Starship.StarshipFields.StarshipClass.rawValue].stringValue
        
        
        let pilotsURL = results[Starship.StarshipFields.Pilots.rawValue]
        let filmsURL = results[Starship.StarshipFields.Films.rawValue]
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(pilotsURL, strKey: "name", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            starship.pilots = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        SwApiManager().fetchSWApiSpecificValueListFromJson(filmsURL, strKey: "title", strDispatchGroup: tempDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
            starship.films = response!.componentsJoinedByString(", ")
            dispatch_group_leave(dispatchGroup!)
        })
        
        dispatch_group_notify(tempDispatchGroup, dispatch_get_main_queue()) {
            do{
                try starship.managedObjectContext!.save()
                print("STARSHIP Name: \(starship.name) SAVED!")
            } catch{
                
                print(error)
            }
            dispatch_group_leave(strDispatchGroup)
        }
    }

    func getEntity(strType: String, completionHandler: (AnyObject?, ErrorType?) -> ()) -> (){
        let fetchRequest = NSFetchRequest(entityName: strType)
        do{
            let result = try managedContext.executeFetchRequest(fetchRequest)
            completionHandler(result, nil)
        } catch{
            completionHandler(nil,error)
            print(error)
        }
    }

}
