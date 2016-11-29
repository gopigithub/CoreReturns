//
//  JCICRCustomInfoTableViewCell.swift
//  CoreReturns
//
//  Created by Mobility on 28/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCustomInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblInformation: UILabel!
    @IBOutlet weak var txtDescription: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextFieldRightView(viewcontrollerRef : UIViewController) {

        txtDescription.rightViewMode = UITextFieldViewMode.Always
        let cameraBtn = UIButton(frame: CGRectMake(0, 0, 30, 30))
        cameraBtn.setImage(UIImage(named: "btnCamera"), forState: UIControlState.Normal)
        cameraBtn.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cameraBtn.addTarget(viewcontrollerRef, action: "btnAction", forControlEvents: UIControlEvents.TouchUpInside)

        txtDescription.rightView = cameraBtn
        txtDescription.rightViewRectForBounds(CGRectMake(bounds.size.width-22, 6, 30, 30))
    }

    func setTextFieldRightView (keyType:textFieldRightView, viewcontrollerRef : UIViewController) {
         switch (keyType) {
         case .editable :
                txtDescription.layer.borderWidth = 1
                txtDescription.layer.cornerRadius = 1
                txtDescription.layer.borderColor = UIColor.blackColor().CGColor
                txtDescription.backgroundColor = UIColor.whiteColor()
                txtDescription.userInteractionEnabled = true
               self.setTextFieldRightView(viewcontrollerRef)
         case .nonEditable :
                txtDescription.layer.borderWidth = 0
                txtDescription.layer.cornerRadius = 0
                txtDescription.layer.borderColor = UIColor.clearColor().CGColor
                txtDescription.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
                txtDescription.textColor = UIColor.whiteColor()
                txtDescription.userInteractionEnabled = false

        }
    }

}
