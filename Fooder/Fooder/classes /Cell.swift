//
//  Cell.swift
//  Fooder
//
//  Created by Josh Bergstrom on 8/3/18.
//  Copyright © 2018 Josh Bergstrom. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Cost: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
