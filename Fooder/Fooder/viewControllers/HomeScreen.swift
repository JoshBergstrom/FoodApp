//
//  HomeScreen.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/27/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit
import CoreLocation

public var UserLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37, 0 )


class HomeScreen: UIViewController, CLLocationManagerDelegate {
    
    //IBOutlets
    @IBOutlet weak var DistanceSegment: UISegmentedControl!
    @IBOutlet weak var PriceSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UITextField!
 
    // food buttons

    @IBOutlet weak var tacoButton: UIButton!
    @IBOutlet weak var burgerButton: UIButton!
    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var barButton: UIButton!
    @IBOutlet weak var chinaButton: UIButton!
    @IBOutlet weak var pancakesButton: UIButton!
    @IBOutlet weak var iceCreamButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var saladButton: UIButton!
    
    
    //unwindSegue
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
    }
    
    //    var for status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //vars
    let manager = CLLocationManager()
    var chosenDistance = 0
    var chosenPrice = "1"
    
    
    
    func setupView() {
        
        let homeScreenButtons: [UIButton] = [tacoButton, burgerButton, pizzaButton, barButton, chinaButton,pancakesButton,iceCreamButton, chickenButton, saladButton]
            
            
        homeScreenButtons.forEach { (button) in
//            button.layer.cornerRadius = button.bounds.width / 2  //45
            button.layer.masksToBounds = true
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        PriceSegment.layer.borderWidth = 1
        PriceSegment.layer.borderColor = UIColor.black.cgColor
        DistanceSegment.layer.borderWidth = 1
        DistanceSegment.layer.borderColor = UIColor.black.cgColor
        PriceSegment.layer.masksToBounds = true
        PriceSegment.layer.cornerRadius = 5
        DistanceSegment.layer.masksToBounds = true
        DistanceSegment.layer.cornerRadius = 5
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.masksToBounds = true
        searchBar.layer.cornerRadius = 5 
        let selectedDistance = DistanceSegment.selectedSegmentIndex
        let distance: Int
        
        switch selectedDistance {
        case 0:
            distance = 1609
        case 1:
            distance = 8046
        case 2:
            distance = 16093
        default:
            distance = 1609
        }
        
        let selectedPrice = PriceSegment.selectedSegmentIndex
        let price: String
        
        switch selectedPrice {
        case 1:
            price = "1"
        case 2:
            price = "1, 2"
        case 3:
            price = "1, 2, 3"
        default:
            price = "1"
            
        }
        chosenPrice = price
        chosenDistance = distance
    }
    
    func search() {
        if searchBar.isFirstResponder {
            self.searchBar.resignFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToTinder"{
            let tinderVC = segue.destination as! TinderScreen
            tinderVC.foodSearched = searchBar.text!
            tinderVC.theDistance = chosenDistance
            tinderVC.thePrice = chosenPrice 
        }
    }
    
    
    
    @IBAction func enterButtonClicked(_ sender: Any) {
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let homeScreenButtons: [UIButton] = [tacoButton, burgerButton, pizzaButton, barButton, chinaButton,pancakesButton,iceCreamButton, chickenButton, saladButton]
        
        homeScreenButtons.forEach { (button) in
            button.layer.cornerRadius = button.layer.bounds.width / 2.0  //45
        }
        
    }
    
    override func viewDidLoad() {
        setupView()
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.activityType = CLActivityType(rawValue: CLActivityType.RawValue(kCLLocationAccuracyNearestTenMeters))!
        manager.startUpdatingLocation()
        
        //dismiss keyboard with tap
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        UserLocation = locations[0].coordinate
        print(UserLocation)
    }
    
    //IBActions
    @IBAction func tacoButton(_ sender: Any) {
        searchBar.text = "tacos"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func burgerButton(_ sender: Any) {
        searchBar.text = "burgers"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func pizzaButton(_ sender: Any) {
        searchBar.text = "pizza"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func barButton(_ sender: Any) {
        searchBar.text = "bar"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func chinaButton(_ sender: Any) {
        searchBar.text = "chinese"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func pancakeButton(_ sender: Any) {
        searchBar.text = "pancakes"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func iceCreamButton(_ sender: Any) {
        searchBar.text = "Ice Cream"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func ChickenButton(_ sender: Any) {
        searchBar.text = "Chicken"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    @IBAction func saladButton(_ sender: Any) {
        searchBar.text = "salad"
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
}
