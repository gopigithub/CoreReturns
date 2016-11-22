//
//  JCICRJobCardViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRJobCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var lblBatteryNo: UILabel!
    @IBOutlet var tblCardTableView: UITableView!
    let descritpion = ["Scan Pallets", "Record any Overage/Damage/Shortage","View BOL","Capture Proof of Delivery "]
    let image = ["barcode","damageReport","dollar","digitalSign"]
    var batteryName : String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblCardTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblCardTableView.dataSource = self
        self.tblCardTableView.delegate = self
        self.tblCardTableView.bounces = false
        self.tblCardTableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.lblBatteryNo.text = self.batteryName
        
        self.setNavigationItemTitle("Job Card")
        self.setDriverInfoButton()


    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: JCICRCustomJobCardTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customJobCardCell") as? JCICRCustomJobCardTableViewCell
        if cell == nil {
            self.tblCardTableView.registerNib(UINib(nibName: "JCICRCustomJobCardTableViewCell", bundle: nil), forCellReuseIdentifier: "customJobCardCell")
            cell = (self.tblCardTableView.dequeueReusableCellWithIdentifier("customJobCardCell") as? JCICRCustomJobCardTableViewCell)!
        }
        let image = UIImage(named: self.image[indexPath.row])
        cell.cardImage.image = image
        cell.cardDescription.text = self.descritpion[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("CardToScanPallet", sender: self)
        case 1:
            self.performSegueWithIdentifier("CardToDamageReport", sender: self)
        case 2:
            self.performSegueWithIdentifier("CardToBOL", sender: self)
        case 3:
            self.performSegueWithIdentifier("CardToDigitalSign", sender: self)
        default:
            break
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "CardToScanPallet") {
            let viewController = segue.destinationViewController as! JCICRScanPalletViewController
            viewController.batteryName = self.batteryName
        }
        if(segue.identifier == "CardToDamageReport") {
            let viewController = segue.destinationViewController as! JCICRDamageReportViewController
            viewController.batteryName = self.batteryName
        }
        if(segue.identifier == "CardToBOL") {
            let viewController = segue.destinationViewController as! JCICRViewBolViewController
            viewController.batteryName = self.batteryName
        }
        if(segue.identifier == "CardToDigitalSign") {
            let viewController = segue.destinationViewController as! JCICRDigitalSignatureViewController
            viewController.batteryName = self.batteryName
        }
        
    }

}
