//
//  MyServiceTableViewCell.swift
//  SideNavigation_Example
//
//  Created by apple on 11/1/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class MyServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceType: UILabel!
    @IBOutlet weak var serviceActive: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var serviceRating: UILabel!
    @IBOutlet weak var servcieLocation: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
