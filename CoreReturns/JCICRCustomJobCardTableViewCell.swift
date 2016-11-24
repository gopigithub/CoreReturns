//
//  JCICRCustomJobCardTableViewCell.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCustomJobCardTableViewCell: UITableViewCell {

    @IBOutlet var cardView: UIView!

    @IBOutlet var cardImage: UIImageView!

    
    @IBOutlet var cardDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.whiteColor().CGColor
        cardView.layer.cornerRadius = 1
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
