//
//  JCICRDriverInfoViewController.swift
//  CoreReturns
//
//  Created by Mobility on 08/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRDriverInfoViewController: UIViewController {
    
    @IBOutlet var driverInfoView: UIView!
    
    @IBOutlet var closeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tag = 101
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.driverInfoView.layer.cornerRadius = 10.0
        self.driverInfoView.layer.borderWidth = 5.0
        self.driverInfoView.layer.borderColor = UIColor.blackColor().CGColor
    }


    @IBAction func closeBtnTapped(sender: AnyObject) {
        self.removeSuperViewInformation()
    }

}
