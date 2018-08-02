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
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var searchBar: UITextField!
    // card views
    @IBOutlet weak var BurgerCard: UIView!
    @IBOutlet weak var PizzaCard: UIView!
    @IBOutlet weak var TacoCard: UIView!
    @IBOutlet weak var BarCard: UIView!
    @IBOutlet weak var ChinaCard: UIView!
    @IBOutlet weak var PancakeCard: UIView!
    //unwindSegue
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
    }
    

    
    //vars
    let manager = CLLocationManager()
    var chosenDistance = 0
    
    func setupView() {
        BurgerCard.layer.cornerRadius = 50
        BurgerCard.layer.masksToBounds = true
        PizzaCard.layer.cornerRadius = 50
        PizzaCard.layer.masksToBounds = true
        TacoCard.layer.cornerRadius = 50
        TacoCard.layer.masksToBounds = true
        PancakeCard.layer.cornerRadius = 50
        PancakeCard.layer.masksToBounds = true
        BarCard.layer.cornerRadius = 50
        BarCard.layer.masksToBounds = true
        ChinaCard.layer.cornerRadius = 50
        ChinaCard.layer.masksToBounds = true
        
        
        let selected: Int = segment.selectedSegmentIndex
        let distance: Int
        
        switch selected {
        case 0:
            distance = 1609
        case 1:
            distance = 8046
        case 2:
            distance = 16093
        default:
            distance = 40000
        }
        
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
            tinderVC.Thedistance = chosenDistance
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
    
    
    

    
    
}
