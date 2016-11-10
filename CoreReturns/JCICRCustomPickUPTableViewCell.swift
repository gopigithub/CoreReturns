//
//  JCICRCustomPickUPTableViewCell.swift
//  CoreReturns
//
//  Created by Mobility on 05/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCustomPickUPTableViewCell: UITableViewCell {
    
    
    @IBOutlet var imgBattery: UIImageView!
    @IBOutlet var lblBatteryNo: UILabel!
    @IBOutlet var imgPickUp: UIImageView!
    @IBOutlet var imgDelivery: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
