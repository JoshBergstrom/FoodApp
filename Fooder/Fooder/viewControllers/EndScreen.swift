//
//  ViewController.swift
//  Fooder
//
//  Created by Josh Bergstrom on 8/2/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

class EndScreen: UIViewController {
    
    var restaurant: Restaurant!
    var pageTop: String = ""
    
    //IBOutlets
    @IBOutlet weak var storeCard: UIView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var bigImage: UIImageView!
    @IBAction func unwindToCellScreenViewController(segue: UIStoryboard) { }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindtoTableViewFromEnd", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeName.text = restaurant.name
        costLabel.text = restaurant.price
        reviewImage.image = restaurant.ratingImage
        self.loadImage(urlString: restaurant.imageURL)
        pageTitle.text = pageTop
        storeCard.layer.masksToBounds = true
        storeCard.layer.cornerRadius = 20
        storeCard.layer.borderWidth = 1
        storeCard.layer.borderColor = UIColor.black.cgColor
    }
    
    
    //    var for status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    func loadImage(urlString: String) {
        if urlString != "" {
            bigImage.af_setImage(withURL: URL(string: urlString)!)
        }else {
            bigImage.image = #imageLiteral(resourceName: "Yelp_trademark_RGB_outline.png")
        }
    }
    
    
    
}
