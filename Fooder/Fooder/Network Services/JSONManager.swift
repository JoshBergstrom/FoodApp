//
//  JSONManager.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/25/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONManager {
    var name: String
    var imageURL: String
    var rating: Double
    var distance: Double
    var categories: String
    var address: String
    var ID: String
    
    init(json: JSON) {
        self.name = json["businesses"][0]["name"].stringValue
        self.imageURL = json["businesses"][0]["image_url"].stringValue
        self.rating = json["businesses"][0]["rating"].doubleValue
        self.categories = json["businesses"][0]["categories"]["title"].stringValue
        self.distance = json["businesses"][0]["distance"].doubleValue
        self.address = json["businesses"][0]["display_address"].stringValue
        self.ID = json["businesses"][0]["id"].stringValue
    }
}


