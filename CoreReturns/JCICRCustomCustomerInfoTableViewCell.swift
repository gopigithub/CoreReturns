//
//  JCICRCustomCustomerInfoTableViewCell.swift
//  CoreReturns
//
//  Created by Vaibhav on 22/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCustomCustomerInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblInfo: UILabel!
    
    @IBOutlet weak var txtDescription: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setTextFieldType (keyType:textFieldKeyBoardType) {
        
        
        switch (keyType) {
            
        case textFieldKeyBoardType.editable:
            txtDescription.layer.borderWidth = 1
            txtDescription.layer.cornerRadius = 1
            txtDescription.layer.borderColor = UIColor.blackColor().CGColor
            txtDescription.userInteractionEnabled = true
        
        case textFieldKeyBoardType.nonEditable:
            txtDescription.layer.borderWidth = 0
            txtDescription.layer.cornerRadius = 0
            txtDescription.layer.borderColor = UIColor.clearColor().CGColor
            txtDescription.layer.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0).CGColor
            txtDescription.userInteractionEnabled = false
            
        case textFieldKeyBoardType.popOver:
            txtDescription.layer.borderWidth = 1
            txtDescription.layer.cornerRadius = 1
            txtDescription.layer.borderColor = UIColor.blackColor().CGColor
            txtDescription.userInteractionEnabled = true
            
        default:
            break
    }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
