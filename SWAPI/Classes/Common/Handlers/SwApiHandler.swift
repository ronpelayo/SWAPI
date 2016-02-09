//
//  swApiHandler.swift
//  SWAPI
//
//  Created by Ron Pelayo on 07/02/2016.
//  Copyright © 2016 Ron Pelayo. All rights reserved.
//

import UIKit
import Alamofire

class SwApiHandler {

    func requestSWPApi(strUrl: String, completionHandler: (NSDictionary?, NSError?) -> ()) -> (){
        Alamofire.request(.GET, strUrl).responseJSON { response in
            
            switch response.result {
                
            case .Success(let data):
                let json = data as? NSDictionary
                completionHandler(json, nil)
            case .Failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func requestSWApiSpecificValue(strUrl: String, strKey: String, completionHandler: (NSDictionary?, NSError?) -> ()) -> (){
        Alamofire.request(.GET, strUrl).responseJSON { response in
            print(response.result.value)
            switch response.result {
            case .Success(let data):
                let value = data as? NSDictionary
                completionHandler(value, nil)
            case .Failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    
}
