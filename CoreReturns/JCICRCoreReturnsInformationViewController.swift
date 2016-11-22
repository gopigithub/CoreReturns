//
//  JCICRCoreReturnsInformationViewController.swift
//  CoreReturns
//
//  Created by Mobility on 21/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCoreReturnsInformationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tblBatteryInfo: UITableView!
    @IBOutlet weak var lblBatteryNo: UILabel!
    
    @IBOutlet weak var btnAddBattery: UIButton!
    
    
    @IBOutlet weak var btnSave: UIButton!
    
    
    
    var batteryName : String = String()
   // var items: [String] = ["We", "Heart", "Swift"]
    
    let sections = [ "Customer Information","Battery Information"]
    
    let items = [
        ["ID","Name","Address","Mobile","Email"],
        ["CRN No","ETN", "SKU number", "Quantity","Condition"]]
    
    
    let itemDescription = [
        ["6327102","Dr. Irene Mary Walker(Irene)","Residence No.1N, 7301 Country Club Dr. Downmey California - 90241 United States","+1 562 127 2090","irenewalker@gmail.com"],
        ["680500100", "OPTIMA® AGM batteries","12V","180Ah","45kg"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.lblBatteryNo.text = self.batteryName
        
        self.tblBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblBatteryInfo.dataSource = self
        self.tblBatteryInfo.delegate = self
        self.tblBatteryInfo.bounces = false
        self.tblBatteryInfo.tableFooterView = UIView(frame: CGRectZero)
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    
    @IBAction func AddMoreBatteryBtnTapped(sender: AnyObject) {
    }
    
    
    @IBAction func SaveNextBtnTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("coreReturnsToDigitalSign", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "coreReturnsToDigitalSign") {
            let viewController = segue.destinationViewController as! JCICRDigitalSignatureViewController
            viewController.isFromCoreReturns = true
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items [section ].count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.sections.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: JCICRCustomCustomerInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell
        if cell == nil {
            self.tblBatteryInfo.registerNib(UINib(nibName: "JCICRCustomCustomerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customCustomerInfoCell")
            cell = (self.tblBatteryInfo.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell)!
        }
        
        cell.lblInfo?.text = self.items[indexPath.section][indexPath.row]
        cell.txtDescription?.text = self.itemDescription[indexPath.section][indexPath.row]
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cell.userInteractionEnabled = false
        
        return cell
    }
 
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLbl = UILabel()
        myLbl.frame = CGRectMake(20, 10, 100, 50)
        myLbl.backgroundColor = UIColor(red: 32/255.0, green: 161/255.0, blue: 149/255.0, alpha: 1.0)
        let title = self.tableView(tableView, titleForHeaderInSection: section)!
        myLbl.text = title
        myLbl.textColor = UIColor.whiteColor()
        myLbl.textAlignment = .Center
        return myLbl
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName: String
        switch section {
        case 0:
            sectionName = "Customer Information"
        case 1:
            sectionName = "Battery Information"
      
        default:
            sectionName = ""
        }
        
        return sectionName
    }
    
 
}
