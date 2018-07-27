//
//  HomeScreen.swift
//  Fooder
//
//  Created by Josh Bergstrom on 7/27/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

// public var's
public var foodSearched: String? = nil
public var zipcode: String? = nil

class HomeScreen: UIViewController {

    //IBOutlets
    @IBOutlet weak var searchRequest: UISearchBar!
    @IBOutlet weak var usersZipcode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
