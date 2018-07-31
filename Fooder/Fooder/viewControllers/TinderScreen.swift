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

class TinderScreen: UIViewController {
    
    //var's for api
    var rating = Double() // this will be used for the rating image
    var foodSearched: String?
    var zipCode: String?
    
    //IBOutlets
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var RatingImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var PageTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let foodToSearch = stringFormat(str: self.foodSearched!)
        let zipcodeToUse = stringFormat(str: self.zipCode!)
        print(zipcodeToUse)
        
        //setting up Api
        let apiUrlString = "https://api.yelp.com/v3/businesses/search?term=\(String((foodToSearch)))&location=98683&open_now=true"
        let url = URL(string: apiUrlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer 9d2iFCXo2NMKtTufVByPDK0G6fS0dYLC2_59rRofz24M2kR6YDn_xILHpbXuWccjPAtlELNFp6RuynLpFjwYmciDarNIeJOGJqB_fxU7KaY6IfOYgIRvN2PkPlZXW3Yx", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //connecting to api
        Alamofire.request(request).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let restaurant = Restaurant(json: json) // make's my restaurant struct = the json
                    //displaying all the info from json
                    self.loadImage(ImageUrlString: restaurant.imageURL)
                    self.rating = restaurant.rating
                    self.storeName.text = restaurant.name
                    self.cost.text = restaurant.price
                    self.PageTitle.text = self.foodSearched
                    // checking the rating to set it to the right image
                    if self.rating == 0 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_0.png")
                    }else if self.rating == 1 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_1.png")
                    }else if self.rating == 1.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_1_half.png")
                    }else if self.rating == 2 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_2.png")
                    }else if self.rating == 2.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_2_half.png")
                    }else  if self.rating == 3 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_3.png")
                    }else  if self.rating == 3.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_3_half.png")
                    }else  if self.rating == 4 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_4.png")
                    }else  if self.rating == 4.5 {
                        self.RatingImage.image = #imageLiteral(resourceName: "regular_4_half.png")
                    }else  if self.rating == 5 {
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
    
    func loadImage(ImageUrlString: String?) {
        if let imageString = URL(string: ImageUrlString!) {
        MainImage.af_setImage(withURL: imageString)
        }
    }
    
    func stringFormat(str: String) -> String{
        var string = ""
        string = str.lowercased()
        string = string.replacingOccurrences(of: " ", with: "_")
        if string.last == "_" {
            string = String(string.dropLast())
        }
        
        return string
    }
    
}


