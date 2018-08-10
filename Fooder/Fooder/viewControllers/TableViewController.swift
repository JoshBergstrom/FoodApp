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
    @IBOutlet weak var pageTitle: UILabel!
    
    
    //unwindSegue
    @IBAction func unwindToTableView(segue: UIStoryboardSegue){
    }
    
    //vars
    var likedRestarunts = [Restaurant]()
    var pagetop:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.layer.cornerRadius = 20
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        pageTitle.text = pagetop

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "cellClicked":
            // 1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            let note = likedRestarunts[indexPath.row]
            // 3
            let destination = segue.destination as! EndScreen
            // 4
            destination.restaurant = note
            destination.pageTop = self.pagetop
        default:
            print("unexpected segue identifier")
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "cellClicked", sender: self)
    }
    
    //    var for status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
