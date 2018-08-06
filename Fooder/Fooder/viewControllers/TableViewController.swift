//
//  TableViewController.swift
//  Fooder
//
//  Created by Josh Bergstrom on 8/3/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var text: UILabel!
    

    //vars
    var likedRestarunts = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.layer.cornerRadius = 20
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedRestarunts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as! StoreTableViewCell

        let store = likedRestarunts[indexPath.row]
        print(store)
       
        cell.storeName.text = store.name
        cell.Cost.text = store.price
        cell.reviewImage.image = store.ratingImage
        
        return cell
    }
    
}
