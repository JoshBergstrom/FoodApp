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

    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var usersZipcode: ZipcodeTextField!    

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
