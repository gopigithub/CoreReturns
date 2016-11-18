//
//  JCICRDamageReportViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRDamageReportViewController: UIViewController {
    
    var batteryName : String = String()

    @IBOutlet weak var lblBatteryNo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationItemTitle("Damage Report")
        self.setDriverInfoButton()
        self.lblBatteryNo.text = self.batteryName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }

}
