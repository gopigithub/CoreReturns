//
//  JCICRCustomCustomerInfoTableViewCell.swift
//  CoreReturns
//
//  Created by Mobility on 22/11/16.
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
    func setTextFieldType (keyType:textFieldKeyBoardType , viewcontrollerRef : UIViewController) {
        
        
        switch (keyType) {
            
        case textFieldKeyBoardType.editableWithButton:

            txtDescription.userInteractionEnabled = true
            self.setTextFieldRightViewButton(viewcontrollerRef)
        
        case textFieldKeyBoardType.editableWithoutButton:

            txtDescription.userInteractionEnabled = true
            
        case textFieldKeyBoardType.etnPopOver:

            txtDescription.userInteractionEnabled = true
            
        case textFieldKeyBoardType.condtionPopOVer:
            txtDescription.userInteractionEnabled = true

    }
    }
    func setTextFieldRightViewButton(viewcontrollerRef : UIViewController) {
        
        txtDescription.rightViewMode = UITextFieldViewMode.Always
        let cameraBtn = UIButton(frame: CGRectMake(0, 0, 30, 30))
        cameraBtn.setImage(UIImage(named: "btnCamera"), forState: UIControlState.Normal)
        cameraBtn.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cameraBtn.addTarget(viewcontrollerRef, action: "btnAction", forControlEvents: UIControlEvents.TouchUpInside)
        
        txtDescription.rightView = cameraBtn
        txtDescription.rightViewRectForBounds(CGRectMake(bounds.size.width-22, 6, 30, 30))
    }
    
    func btnAction(sender:UIButton!) {
       // self.showCoreAlertView("")
       // showCorePickupAlertView()
        
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
