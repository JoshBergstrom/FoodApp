//
//  ViewController.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/24/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//



// view controller for the main tinder like page 
import UIKit
import SwiftyJSON
import Alamofire


class ViewController: UIViewController {
    var foodsearched = String()
    

    
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var RatingImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var storeName: UILabel!
    
    var MainImageUrl = "https://s3-media2.fl.yelpcdn.com/bphoto/7AJax0lwL78aRorRGjvw8A/o.jpg"                                   //this will be used to find the image Update later
    var rating = Double() // this will be used for the rating image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // im connecting all the api info
        let apiToContact = "https://api.yelp.com/v3/businesses/search?term=\(foodsearched)&latitude=37.786882&longitude=-122.399972"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let restaurant = Restaurant(json: json)
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


