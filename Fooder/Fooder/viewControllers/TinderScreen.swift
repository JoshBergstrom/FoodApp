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
    

    // all restaurants 
    var restaurants: [Restaurant] = []
    
    // liked restaurants
    var storedRestaurants: [Restaurant] = []
    
    //var's for api
    var rating = Double() // this will be used for the rating image
    var foodSearched: String = ""
    var theDistance: Int = 1609
    var thePrice: String = "1"
    var storeNum: Int = 0

    
//    var for status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //IBOutlets
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var RatingImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var PageTitle: UILabel!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var XCard: UIView!
    @IBOutlet weak var HeartCard: UIView!
    @IBAction func heartbutton(_ sender: Any) {
        guard restaurants.isEmpty == false else { return }
        storeCurrentRestaurant()
    }
    @IBAction func Xbutton(_ sender: Any) {
        guard restaurants.isEmpty == false else { return }
        removeCurrentRestaurant()
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    var currentlyVisibleRestaurant: Restaurant? {
        get {
            return restaurants.first
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TableViewController
        destination.likedRestarunts = storedRestaurants
        destination.pagetop = self.foodSearched
        }
    
    
    
    func updateUI()  {
        //displaying all the info from json
        if let currentlyVisibleRestaurant = self.currentlyVisibleRestaurant {
            self.loadImage(urlString: currentlyVisibleRestaurant.imageURL)
            self.rating = currentlyVisibleRestaurant.rating
            self.storeName.text = currentlyVisibleRestaurant.name
            self.cost.text = currentlyVisibleRestaurant.price
            self.PageTitle.text = self.titleFormate(str: self.foodSearched)
            // checking the rating to set it to the right image
            self.RatingImage.image = currentlyVisibleRestaurant.ratingImage
        } else {
            print(storedRestaurants.count)
            performSegue(withIdentifier: "showCells", sender: self)
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
        CardView.layer.borderWidth = 1
        CardView.layer.borderColor = UIColor.black.cgColor 
        XCard.layer.cornerRadius = 45
        XCard.layer.masksToBounds = true
        HeartCard.layer.cornerRadius = 45
        HeartCard.layer.masksToBounds = true
        XCard.layer.borderWidth = 1
        XCard.layer.borderColor = UIColor.black.cgColor
        HeartCard.layer.borderWidth = 1
        HeartCard.layer.borderColor = UIColor.black.cgColor
        let foodToSearch = stringFormat(str: self.foodSearched)
        
        
        //left swipe recognizer
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        //right swipe recognizer
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        //myBlockOfCodeToCallWhenGetRestauntsIsDone
        let myBlockOfCodeToCallWhenGetRestauntsIsDone: ([Restaurant]) -> () = { restaurantsFromYelp in
            
            if restaurantsFromYelp.count != 0 {
                self.restaurants = restaurantsFromYelp
                self.updateUI()
            } else {
                
            }
            
        }
        YelpService.getRestarunts(foodToSearch: foodToSearch, theDistance: String(theDistance), thePrice: thePrice, completionHandler: myBlockOfCodeToCallWhenGetRestauntsIsDone)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // updates Mainimage IBOutlet
    func loadImage(urlString: String) {
        if urlString != "" {
        MainImage.af_setImage(withURL: URL(string: urlString)!)
        }else {
            MainImage.image = #imageLiteral(resourceName: "Yelp_trademark_RGB_outline.png")
        }
        
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
        guard restaurants.isEmpty == false else { return }
        
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




