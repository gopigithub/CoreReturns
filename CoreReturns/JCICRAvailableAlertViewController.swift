//
//  JCICRAvailableAlertViewController.swift
//  CoreReturns
//
//  Created by Mobility on 21/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRAvailableAlertViewController: UIViewController {
    
    
    @IBOutlet weak var coreReturnsAlertView: UIView!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    var batteryName : String = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.coreReturnsAlertView.layer.cornerRadius = 10.0
        self.coreReturnsAlertView.layer.borderWidth = 5.0
        self.coreReturnsAlertView.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnYes.layer.cornerRadius = 5
        self.btnYes.layer.borderWidth = 1
        self.btnYes.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnNo.layer.cornerRadius = 5
        self.btnNo.layer.borderWidth = 1
        self.btnNo.layer.borderColor = UIColor.blackColor().CGColor
    }


    @IBAction func CloseBtnTapped(sender: AnyObject) {
        self.removeSuperViewInformation()
    }
    
    
    @IBAction func YesBtnTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("showCoreReturnsInfo", sender: self)
        self.view.removeFromSuperview()
    }

    
    @IBAction func NoBtnTapped(sender: AnyObject) {
        self.removeSuperViewInformation()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showCoreReturnsInfo") {
            let viewController = segue.destinationViewController as! JCICRBatteryInformationViewController
            viewController.batteryName = self.batteryName
        }
    }



}
