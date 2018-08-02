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
    let ratingImage: UIImage
    let categories: String
    let address: String
    let ID: String
    let price: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.imageURL = json["image_url"].stringValue
        self.rating = json["rating"].doubleValue
        self.categories = json["categories"]["title"].stringValue
        self.address = json["display_address"].stringValue
        self.ID = json["id"].stringValue
        self.price = json["price"].stringValue
        
        if self.rating == 0 {
            ratingImage = #imageLiteral(resourceName: "regular_0.png")
        }else if self.rating == 1 {
            ratingImage = #imageLiteral(resourceName: "regular_1.png")
        }else if self.rating == 1.5 {
            ratingImage = #imageLiteral(resourceName: "regular_1_half.png")
        }else if self.rating == 2 {
            ratingImage = #imageLiteral(resourceName: "regular_2.png")
        }else if self.rating == 2.5 {
            ratingImage = #imageLiteral(resourceName: "regular_2_half.png")
        }else  if self.rating == 3 {
            ratingImage = #imageLiteral(resourceName: "regular_3.png")
        }else  if self.rating == 3.5 {
            ratingImage = #imageLiteral(resourceName: "regular_3_half.png")
        }else  if self.rating == 4 {
            ratingImage = #imageLiteral(resourceName: "regular_4.png")
        }else  if self.rating == 4.5 {
            ratingImage = #imageLiteral(resourceName: "regular_4_half.png")
        }else  if self.rating == 5 {
            ratingImage = #imageLiteral(resourceName: "regular_5.png")
        }else {
            ratingImage = #imageLiteral(resourceName: "Yelp_trademark_RGB_outline.png")
        }
    }
}







