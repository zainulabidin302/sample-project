//
//  MyCarsTableViewCell.swift
//  SideNavigation_Example
//
//  Created by apple on 11/1/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class MyCarsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ratting: UILabel!
    @IBOutlet weak var verificationTopLabel: UILabel!
    @IBOutlet weak var verficationMidLabel: UILabel!

    
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var color: UILabel!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var city: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
