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
    // card views
    @IBOutlet weak var BurgerCard: UIView!
    @IBOutlet weak var PizzaCard: UIView!
    @IBOutlet weak var TacoCard: UIView!
    @IBOutlet weak var BarCard: UIView!
    @IBOutlet weak var ChinaCard: UIView!
    @IBOutlet weak var PancakeCard: UIView!
    @IBOutlet weak var iceCreamCard: UIView!
    @IBOutlet weak var saladCard: UIView!
    @IBOutlet weak var chickenCard: UIView!
    
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
        BurgerCard.layer.cornerRadius = 45
        BurgerCard.layer.masksToBounds = true
        PizzaCard.layer.cornerRadius = 45
        PizzaCard.layer.masksToBounds = true
        TacoCard.layer.cornerRadius = 45
        TacoCard.layer.masksToBounds = true
        PancakeCard.layer.cornerRadius = 45
        PancakeCard.layer.masksToBounds = true
        BarCard.layer.cornerRadius = 45
        BarCard.layer.masksToBounds = true
        ChinaCard.layer.cornerRadius = 45
        ChinaCard.layer.masksToBounds = true
        saladCard.layer.cornerRadius = 45
        saladCard.layer.masksToBounds = true
        iceCreamCard.layer.cornerRadius = 45
        iceCreamCard.layer.masksToBounds = true
        chickenCard.layer.cornerRadius = 45
        chickenCard.layer.masksToBounds = true
        TacoCard.layer.borderWidth = 1
        TacoCard.layer.borderColor = UIColor.black.cgColor
        PizzaCard.layer.borderWidth = 1
        PizzaCard.layer.borderColor = UIColor.black.cgColor
        BurgerCard.layer.borderWidth = 1
        BurgerCard.layer.borderColor = UIColor.black.cgColor
        PancakeCard.layer.borderWidth = 1
        PancakeCard.layer.borderColor = UIColor.black.cgColor
        BarCard.layer.borderWidth = 1
        BarCard.layer.borderColor = UIColor.black.cgColor
        ChinaCard.layer.borderWidth = 1
        ChinaCard.layer.borderColor = UIColor.black.cgColor
        PriceSegment.layer.borderWidth = 1
        PriceSegment.layer.borderColor = UIColor.black.cgColor
        DistanceSegment.layer.borderWidth = 1
        DistanceSegment.layer.borderColor = UIColor.black.cgColor
        chickenCard.layer.borderWidth = 1
        chickenCard.layer.borderColor = UIColor.black.cgColor
        saladCard.layer.borderWidth = 1
        saladCard.layer.borderColor = UIColor.black.cgColor
        iceCreamCard.layer.borderWidth = 1
        iceCreamCard.layer.borderColor = UIColor.black.cgColor
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
