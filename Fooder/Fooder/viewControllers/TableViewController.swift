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
    
//    @IBAction func backButtonPressed(_ sender: Any) {
//        self.performSegue(withIdentifier: "unwindToHome", sender: self)
//    }
    //vars
    var likedRestarunts = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(StoreTableViewCell.self, forCellReuseIdentifier: "storeCell")
        print("NumRest: \(likedRestarunts.count)")
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
       
//        cell.storeName.text = "name"
//        cell.Cost.text = "price"
//        cell.reviewImage.image = #imageLiteral(resourceName: "regular_0.png")
        
        return cell
    }
    
}
