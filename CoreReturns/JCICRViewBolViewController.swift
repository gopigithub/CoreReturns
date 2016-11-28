//
//  JCICRViewBolViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRViewBolViewController: UIViewController {
    
    @IBOutlet weak var lblBatteryNo: UILabel!
    var batteryName : String = String()
    @IBOutlet var webvwPdf: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblBatteryNo.text = self.batteryName

        let pdfLoc = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bill", ofType:"pdf")!) //replace PDF_file with your pdf die name
        let request = NSURLRequest(URL: pdfLoc);
        self.webvwPdf.loadRequest(request);

        self.setNavigationItemTitle("View BOL")
        self.setDriverInfoButton()
       
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }

}
