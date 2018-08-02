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
    
    var restaurants: [Restaurant] = []
    
    var storedRestaurants: [Restaurant] = []
    
    //var's for api
    var rating = Double() // this will be used for the rating image
    var foodSearched: String?
    var theDistance: Int = 1609
    var thePrice: String = "1"
    var storeNum: Int = 0
    
    
    //IBOutlets
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var RatingImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var PageTitle: UILabel!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var XCard: UIView!
    @IBOutlet weak var HeartCard: UIView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    var currentlyVisibleRestaurant: Restaurant? {
        get {
            return restaurants.first
        }
    }
    
    func updateUI()  {
        //displaying all the info from json
        if let currentlyVisibleRestaurant = self.currentlyVisibleRestaurant {
            self.loadImage(urlString: currentlyVisibleRestaurant.imageURL)
            self.rating = currentlyVisibleRestaurant.rating
            self.storeName.text = currentlyVisibleRestaurant.name
            self.cost.text = currentlyVisibleRestaurant.price
            self.PageTitle.text = self.titleFormate(str: self.foodSearched!)
            // checking the rating to set it to the right image
            self.RatingImage.image = currentlyVisibleRestaurant.ratingImage
        } else {
            
        }
        
    }
    
    func storeCurrentRestaurant() {
        guard let currentRestaurant = currentlyVisibleRestaurant else {
            fatalError("there are no visible resutants when the user swiped right")
        }
        
        storedRestaurants.append(currentRestaurant)
        restaurants.removeFirst()
        updateUI()
    }
    
    func removeCurrentRestaurant() {
        restaurants.removeFirst()
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardView.layer.cornerRadius = 20
        CardView.layer.masksToBounds = true
        XCard.layer.cornerRadius = 40
        XCard.layer.masksToBounds = true
        HeartCard.layer.cornerRadius = 40
        HeartCard.layer.masksToBounds = true
        let foodToSearch = stringFormat(str: self.foodSearched!)
        
        
        //left swipe recognizer
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        //right swipe recognizer
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let myBlockOfCodeToCallWhenGetRestauntsIsDone: ([Restaurant]) -> () = { restaurantsFromYelp in
            self.restaurants = restaurantsFromYelp
            self.updateUI()
        }
        YelpService.getRestarunts(foodToSearch: foodToSearch, theDistance: String(theDistance), thePrice: thePrice, completionHandler: myBlockOfCodeToCallWhenGetRestauntsIsDone)
//
//        //setting up Api
//        let urlstring = "https://api.yelp.com/v3/businesses/search?term=\(String((foodToSearch)))&latitude=\(UserLocation.latitude)&longitude=\(UserLocation.longitude)&open_now=true&radius=\(String(theDistance))&price=\(String(thePrice))"
//        let url = URL(string: urlstring)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.setValue("Bearer 9d2iFCXo2NMKtTufVByPDK0G6fS0dYLC2_59rRofz24M2kR6YDn_xILHpbXuWccjPAtlELNFp6RuynLpFjwYmciDarNIeJOGJqB_fxU7KaY6IfOYgIRvN2PkPlZXW3Yx", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        //          connecting to api
//        Alamofire.request(request).validate().responseJSON() { response in
//            switch response.result {
//            case .success:
//
//                if let value = response.result.value {
//                    for store in 1...10 {
//                        let json = JSON(value)
//                        let restaurant = Restaurant(json: json, for: store) // make's my restaurant struct = the json
//                        restaurants.append(restaurant)
//
//                        //displaying all the info from json
//
//                        self.loadImage(urlString: restaurant.imageURL)
//                        self.rating = restaurant.rating
//                        self.storeName.text = restaurant.name
//                        currentStoreName = self.storeName.text!
//                        self.cost.text = restaurant.price
//                        self.PageTitle.text = self.titleFormate(str: self.foodSearched!)
//                        // checking the rating to set it to the right image
//                        self.RatingImage.image = restaurant.ratingImage
//
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // updates Mainimage IBOutlet
    func loadImage(urlString: String) {
        MainImage.af_setImage(withURL: URL(string: urlString)!)
    }
    
    //formating the url for the api
    func stringFormat(str: String) -> String{
        var string = ""
        string = str.lowercased()
        string = string.replacingOccurrences(of: " ", with: "_")
        if string.last == "_" {
            string = String(string.dropLast())
        }
        
        return string
    }
    
    //formating the title for tinder page
    func titleFormate(str: String) -> String{
        var string = ""
        string = str.capitalized
        string = string.replacingOccurrences(of: " ", with: "")
        if string.last == "_" {
            string = String(string.dropLast())
        }
        return string
    }
    
}

//swipeAction
extension TinderScreen
{
    @objc func swipeAction(swipe: UISwipeGestureRecognizer)
    {
        switch swipe.direction.rawValue {
        case 1:
            storeCurrentRestaurant()
        case 2:
            removeCurrentRestaurant()
        default:
            break
        }
    }
}

//Reload view
extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
}




