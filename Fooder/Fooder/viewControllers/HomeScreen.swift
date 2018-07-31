//
//  HomeScreen.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/27/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

// public var's
//public var zipcode: String? = nil

class HomeScreen: UIViewController {
    
    //IBOutlets
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var usersZipcode: UITextField!
    
    // Fast search card views
    
    @IBOutlet weak var BurgerCard: UIView!
    @IBOutlet weak var PizzaCard: UIView!
    @IBOutlet weak var TacoCard: UIView!
    @IBOutlet weak var BarCard: UIView!
    @IBOutlet weak var ChinaCard: UIView!
    @IBOutlet weak var PancakeCard: UIView!
    
    
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
            tinderVC.zipCode = usersZipcode.text!
        }
    }
    
    
    
    @IBAction func enterButtonClicked(_ sender: Any) {
        search()
        performSegue(withIdentifier: "moveToTinder", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
