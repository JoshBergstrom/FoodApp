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
import AlamofireImage

class ViewController: UIViewController {
    
    //var's for api
    var foodsearched = String()
    var zipcode = String()
    var rating = Double() // this will be used for the rating image
    
    //IBOutlets
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var RatingImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // connecting to the api
        let apiToContact = "https://api.yelp.com/v3/businesses/search?term=\(foodsearched)&location=\(zipcode)&open_now=true"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let restaurant = Restaurant(json: json) // make's my restaurant struct = the json
                    //displaying all the info from json
                    self.loadImage(urlString: restaurant.imageURL)
                    self.rating = restaurant.rating
                    self.storeName.text = restaurant.name
                    self.cost.text = restaurant.price
                    
                    // checking the rating to set it to the right image
                    if self.rating == 0 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_0.png")
                    }; if self.rating == 1 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_1.png")
                    }; if self.rating == 1.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_1_half.png")
                    }; if self.rating == 2 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_2.png")
                    };  if self.rating == 2.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_2_half.png")
                    };  if self.rating == 3 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_3.png")
                    };  if self.rating == 3.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_3_half.png")
                    };  if self.rating == 4 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_4.png")
                    };  if self.rating == 4.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_4_half.png")
                    };  if self.rating == 5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_5.png")
                    }else {
                        self.RatingImage.image = nil
                    }
                    
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
    
    // updates Mainimage IBOutlet
    func loadImage(urlString: String) {
        MainImage.af_setImage(withURL: URL(string: urlString)!)
    }

}


