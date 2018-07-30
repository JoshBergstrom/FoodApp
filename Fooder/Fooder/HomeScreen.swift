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
    @IBAction func enterButtonClicked(_ sender: Any) {
        if self.searchBar.isFirstResponder{
            self.searchBar.resignFirstResponder()
            foodSearched = searchBar.text
            zipcode = usersZipcode.text
        }
        guard let searchBar = self.searchBar.text else {return}
        foodSearched = searchBar
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
