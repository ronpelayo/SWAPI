//
//  SwApiManager.swift
//  SWAPI
//
//  Created by Ron Pelayo on 08/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwApiManager {
    
    enum ApiType: String{
        case People = "people"
        case Planets = "planets"
        case Species = "species"
        case Vehicles = "vehicles"
        case Starships = "starships"
        case Films = "films"
    }
 
    func fetchPeople(){
        let peopleURL = "http://swapi.co/api/people/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(peopleURL, strArrayCallback: tempDictionary,strApiType: ApiType.People)
    }
    
    func fetchPlanets(){
        let planetURL = "http://swapi.co/api/planets/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(planetURL, strArrayCallback: tempDictionary,strApiType: ApiType.Planets)
    }
    
    func fetchFilms(){
        let filmsURL = "http://swapi.co/api/films/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(filmsURL, strArrayCallback: tempDictionary,strApiType: ApiType.Films)
    }
    
    func fetchSpecies(){
        let speciesURL = "http://swapi.co/api/species/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(speciesURL, strArrayCallback: tempDictionary,strApiType: ApiType.Species)
    }
    
    func fetchVehicles(){
        let vehiclesURL = "http://swapi.co/api/vehicles/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(vehiclesURL, strArrayCallback: tempDictionary,strApiType: ApiType.Vehicles)
    }
    
    func fetchStarships(){
        let starshipsURL = "http://swapi.co/api/starships/"
        let tempDictionary = NSMutableDictionary()
        
        self.fetchAllSWApiList(starshipsURL, strArrayCallback: tempDictionary,strApiType: ApiType.Starships)
    }
    
    
    
    func fetchSWApiSpecificValue(strUrl: String, strKey: String, strDispatchGroup: dispatch_group_t, completionHandler: (String?, dispatch_group_t?, NSError?) -> ()) -> (){
        
        dispatch_group_enter(strDispatchGroup)
        var name = ""
        
        SwApiHandler().requestSWPApi(strUrl, completionHandler: {(response,error) in
            guard let _ = response else {
                print("URL: \(strUrl)-----\(error)")
                return
            }
            
            let json = JSON(response!)
            name = json[strKey].stringValue
            if (!name.isEmpty){
                completionHandler(name,strDispatchGroup,nil)
            }
            else{
                completionHandler(nil,strDispatchGroup,error)
            }
        })
    }
    
    
    func fetchSWApiSpecificValueListFromJson(jsonArray: JSON, strKey: String, strDispatchGroup: dispatch_group_t, completionHandler: (NSMutableArray?, dispatch_group_t?, NSError?) -> ()) -> (){
        
        let tempGroup = dispatch_group_create()
        dispatch_group_enter(strDispatchGroup)
        let name = NSMutableArray()
        
        for (_,url):(String,JSON) in jsonArray{
            dispatch_group_enter(tempGroup)
            self.fetchSWApiSpecificValue(url.stringValue, strKey: strKey, strDispatchGroup: strDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
                name.addObject(response!)
                dispatch_group_leave(tempGroup)
                dispatch_group_leave(strDispatchGroup)
            })
        }
        dispatch_group_notify(tempGroup, dispatch_get_main_queue(),{
            completionHandler(name,strDispatchGroup,nil)
        })
    }
    
    
    func fetchAllSWApiList(strUrl: String, strArrayCallback: NSMutableDictionary, strApiType: ApiType){
        let url = strUrl
        // add func or place it here? (get result and set person data model)
        SwApiHandler().requestSWPApi(url, completionHandler: {(response, error) in
            
            let json  = JSON(response!)
            
            print("Did Detect a dictionary")
            
            self.handleSWEntityApi(json, apiType: strApiType)

            guard  let nextPage: String = response!["next"]! as? String else {
                print("End Of Page")
                print(strArrayCallback.description)
               return
            }
            print(nextPage)
            self.fetchAllSWApiList(nextPage, strArrayCallback: strArrayCallback,strApiType: strApiType)

        })
    }
    
    func handleSWEntityApi(json: JSON,apiType: ApiType){
        let jsonResult = json["results"]
        let entityGroup = dispatch_group_create()
        for(_, result):(String, JSON) in jsonResult{
            let swEntityManager = SWEntitiesManager()
            dispatch_group_enter(entityGroup)
            switch(apiType){
            case .People: swEntityManager.addPerson(result, strDispatchGroup: entityGroup)
                break
            case .Planets: swEntityManager.addPlanet(result, strDispatchGroup: entityGroup)
                break
            case .Species: swEntityManager.addSpecies(result, strDispatchGroup: entityGroup)
                break
            case .Starships: swEntityManager.addStarship(result, strDispatchGroup: entityGroup)
                break
            case .Vehicles: swEntityManager.addVehicle(result, strDispatchGroup: entityGroup)
                break
            case .Films: swEntityManager.addFilm(result, strDispatchGroup: entityGroup)
                break
            }
        }
        dispatch_group_notify(entityGroup, dispatch_get_main_queue(), {
            print("Database by pagination of \(apiType.rawValue.uppercaseString) is now updated")
            NSNotificationCenter.defaultCenter().postNotificationName(apiType.rawValue.uppercaseString, object: nil)
            //Add NSNOTIFICATION to reload data in Table
        })
    }
    
}
