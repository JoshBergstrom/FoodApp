//
//  ViewController.swift
//  Fooder
//
//  Created by Josh Bergstrom on 8/2/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

class EndScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        directionButton.layer.masksToBounds = true
        directionButton.layer.cornerRadius = 10
        directionButton.layer.borderWidth = 1
        directionButton.layer.borderColor = UIColor.black.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    var for status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var directionButton: UIButton!
    @IBAction func unwindToHomeScreenViewController(segue: UIStoryboard) { }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindtoHomeFromEnd", sender: self)
    }
    
    
    

}
