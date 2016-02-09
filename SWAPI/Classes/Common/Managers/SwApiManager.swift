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
    
    let swApiHandler = SwApiHandler()
    
    func printAPI(){
    
    swApiHandler.requestSWPApi("http://swapi.co/api/people", completionHandler: {(response, error) in
        
        let json = JSON(response!)
        let jsonResult = json["results"]
        let personGroup = dispatch_group_create()
        for (_,person):(String, JSON) in jsonResult{
            dispatch_group_enter(personGroup)
            let name = person["name"].stringValue
            let height = person["height"].intValue
            let mass = person["mass"].intValue
            let hairColor = person["hair_color"].stringValue
            let skinColor = person["skin_color"].stringValue
            let eyeColor = person["eye_color"].stringValue
            let birthYear = person["birth_year"].stringValue
            let gender = person["gender"].stringValue
            let homeWorldUrl = person["homeworld"].stringValue
            let homeWorldNameKey = "name"
            var homeWorld = ""
            var films = ""
            self.getSWApiSpecificValue(homeWorldUrl, strKey: homeWorldNameKey,strDispatchGroup: personGroup, completionHandler: {(response,strDispatchGroup,error) in
                
                homeWorld = response!
                dispatch_group_leave(strDispatchGroup!)
            })
            self.getSWApiSpecificValueListFromJson(person["films"], strKey: "title", strDispatchGroup: personGroup, completionHandler: {(testArray,strDispatchGroup,error) in
                films = testArray!.componentsJoinedByString(", ")
                dispatch_group_leave(strDispatchGroup!)
            })
            dispatch_group_leave(personGroup)
            dispatch_group_notify(personGroup, dispatch_get_main_queue(), {
                print("Name: \(name)")
                print("Height: \(height)")
                print("Mass: \(mass)")
                print("Hair Color: \(hairColor)")
                print("Skin Color: \(skinColor)")
                print("Eye Color: \(eyeColor)")
                print("Birth Year: \(birthYear)")
                print("Gender: \(gender)")
                print("Home World: \(homeWorld)")
                print("Films: \(films)")
                print("------------------------------")

            })
        
        }
    })
    }
    
    func getSWApiSpecificValue(strUrl: String, strKey: String, strDispatchGroup: dispatch_group_t, completionHandler: (String?, dispatch_group_t?, NSError?) -> ()) -> (){
        
        dispatch_group_enter(strDispatchGroup)
        var name = ""
        swApiHandler.requestSWPApi(strUrl, completionHandler: {(response,error) in
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
    
    func getSWApiSpecificValueList(strUrl: String, strListKey: String, strKey: String, strDispatchGroup: dispatch_group_t, completionHandler: (NSMutableArray?, dispatch_group_t?, NSError?) -> ()) -> (){
        
        dispatch_group_enter(strDispatchGroup)
        let name = NSMutableArray()
        swApiHandler.requestSWPApi(strUrl, completionHandler: {(response,error) in
            let json = JSON(response!)
            let jsonResult = json[strListKey]
            for (_,result):(String, JSON) in jsonResult{
                name.addObject(result[strKey].stringValue)
            }
            if (name.count != 0){
                completionHandler(name,strDispatchGroup,nil)
            }
            else{
                completionHandler(nil,strDispatchGroup,error)
            }
            
        })
    }
    
    func getSWApiSpecificValueListFromJson(jsonArray: JSON, strKey: String, strDispatchGroup: dispatch_group_t, completionHandler: (NSMutableArray?, dispatch_group_t?, NSError?) -> ()) -> (){
        
        let tempGroup = dispatch_group_create()
        dispatch_group_enter(strDispatchGroup)
        let name = NSMutableArray()
        
        for (_,url):(String,JSON) in jsonArray{
            dispatch_group_enter(tempGroup)
            self.getSWApiSpecificValue(url.stringValue, strKey: strKey, strDispatchGroup: strDispatchGroup, completionHandler: {(response,dispatchGroup,error) in
                name.addObject(response!)
                dispatch_group_leave(tempGroup)
                dispatch_group_leave(strDispatchGroup)
            })
        }
        dispatch_group_notify(tempGroup, dispatch_get_main_queue(),{
        completionHandler(name,strDispatchGroup,nil)
        })
    }
    

}
