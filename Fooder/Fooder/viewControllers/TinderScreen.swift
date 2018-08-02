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


public var storeNumber: Int = 0
public var currentStoreName = ""

class TinderScreen: UIViewController {
    
    //var's for api
    var rating = Double() // this will be used for the rating image
    var foodSearched: String?
    var Thedistance: Int = 0 
    
    
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
        
        //setting up Api
        let urlstring = "https://api.yelp.com/v3/businesses/search?term=\(String((foodToSearch)))&latitude=\(UserLocation.latitude)&longitude=\(UserLocation.longitude)&open_now=true&radius=\(String(Thedistance))"
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
                    let restaurant = Restaurant(json: json) // make's my restaurant struct = the json
                    //displaying all the info from json
                    
                    self.loadImage(urlString: restaurant.imageURL)
                    self.rating = restaurant.rating
                    self.storeName.text = restaurant.name
                    currentStoreName = self.storeName.text!
                    self.cost.text = restaurant.price
                    self.PageTitle.text = self.titleFormate(str: self.foodSearched!)
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
extension UIViewController
{
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        switch swipe.direction.rawValue {
        case 1:
            print("swipedright")
            storeNumber += 1
            if storeNumber < 10 {
                
            }
        case 2:
            print("swipedLeft")
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



