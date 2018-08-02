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
    
    init(json: JSON, for index: Int) {
        self.name = json["businesses"][index]["name"].stringValue
        self.imageURL = json["businesses"][index]["image_url"].stringValue
        self.rating = json["businesses"][index]["rating"].doubleValue
        self.categories = json["businesses"][index]["categories"]["title"].stringValue
        self.address = json["businesses"][index]["display_address"].stringValue
        self.ID = json["businesses"][index]["id"].stringValue
        self.price = json["businesses"][index]["price"].stringValue
    }
}







