//
//  restaurant.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/25/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Restaurant {
    let name: String
    let imageURL: String
    let rating: Double
    let categories: String
    let address: String
    let ID: String
    let price: String
    
    init(json: JSON) {
        self.name = json["businesses"][0]["name"].stringValue
        self.imageURL = json["businesses"][0]["image_url"].stringValue
        self.rating = json["businesses"][0]["rating"].doubleValue
        self.categories = json["businesses"][0]["categories"]["title"].stringValue
        self.address = json["businesses"][0]["display_address"].stringValue
        self.ID = json["businesses"][0]["id"].stringValue
        self.price = json["businesses"][0]["price"].stringValue
    }
}







