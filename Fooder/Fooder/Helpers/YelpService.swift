//
//  YelpService.swift
//  Fooder
//
//  Created by Josh Bergstrom on 8/2/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct YelpService {
    
    static func getRestarunts(foodToSearch: String, theDistance: String, thePrice: String, completionHandler: @escaping ([Restaurant]) -> ()) {
        //setting up Api
        let urlstring = "https://api.yelp.com/v3/businesses/search?term=\(String((foodToSearch)))&latitude=\(UserLocation.latitude)&longitude=\(UserLocation.longitude)&open_now=true&radius=\(String(theDistance))&price=\(String(thePrice))"
        let url = URL(string: urlstring)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer 9d2iFCXo2NMKtTufVByPDK0G6fS0dYLC2_59rRofz24M2kR6YDn_xILHpbXuWccjPAtlELNFp6RuynLpFjwYmciDarNIeJOGJqB_fxU7KaY6IfOYgIRvN2PkPlZXW3Yx", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //          connecting to api
        Alamofire.request(request).validate().responseJSON() { response in
            switch response.result {
            case .success:
                
                if let value = response.result.value {
                    let json = JSON(value)
                    let businessesJson = json["businesses"].arrayValue
                    var restaurants: [Restaurant] = []
                    for businessIndex in 0..<10 {
                        let businessJson = businessesJson[businessIndex]
                        let restaurant = Restaurant(json: businessJson) // make's my restaurant struct = the json
                        restaurants.append(restaurant)
                    }
                    
                    completionHandler(restaurants)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
