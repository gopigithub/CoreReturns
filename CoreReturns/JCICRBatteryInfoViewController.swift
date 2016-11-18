//
//  JCICRBatteryInfoViewController.swift
//  CoreReturns
//
//  Created by Mobility on 05/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRBatteryInfoViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var lblBatteryNo: UILabel!
    @IBOutlet var tblDetailBatteryInfo: UITableView!
    @IBOutlet var btnGetDirections: UIButton!
    @IBOutlet var btnJobCard: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    var batteryName:String = String()
    
    let objJCICRHomeViewController = JCICRHomeViewController()

    let sections = ["Battery Information", "Delivery Information"]
    let items = [["ETN", "Voltage", "Capacity","Cold Cranking Amps","Weight","Size"], ["Name", "Residence Address", "Home Number", "Mobile Number", "Email"]]
    let itemDescription = [["680500100","12V","180Ah","1000A","45kg","513X223X223mm"],["Dr. Irene Mary Walker(Irene)","Residence No.1N, 7301 Country Club Dr, Downmey California - 90241, United States","+1 112867 1324","+1 562 127 2090","irenewalker@gmail.com"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDetailBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblDetailBatteryInfo.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        self.tblDetailBatteryInfo.bounces = false
        self.tblDetailBatteryInfo?.tableFooterView = UIView(frame: CGRectZero)
        

       self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        
        self.lblBatteryNo.text = self.batteryName

    }
  
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }

    @IBAction func GetDirectionsBtnTapped(sender: AnyObject) {
        
        self.performSegueWithIdentifier("DetailToMap", sender: self)
    }
    


    @IBAction func JobCardBtnTapped(sender: AnyObject) {
        
        
        self.performSegueWithIdentifier("DetailToJobCard", sender: self)
        
    }
    
    
    
    @IBAction func btnCancelTapped(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items [section ].count
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell: JCICRCustomBatteryInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customBatteryInfoCell") as? JCICRCustomBatteryInfoTableViewCell
        if cell == nil {
            self.tblDetailBatteryInfo.registerNib(UINib(nibName: "JCICRCustomBatteryInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customBatteryInfoCell")
            cell = (self.tblDetailBatteryInfo.dequeueReusableCellWithIdentifier("customBatteryInfoCell") as? JCICRCustomBatteryInfoTableViewCell)!
        }

        cell.lblInfomation?.text = self.items[indexPath.section][indexPath.row]
        cell.lblDescription?.text = self.itemDescription[indexPath.section][indexPath.row]
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cell.userInteractionEnabled = false
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.sections.count
        
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
            sectionName = "Battery Information"
        case 1:
            sectionName = "Delivery Information"
            // ...
        default:
            sectionName = ""
        }
        
        return sectionName
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "DetailToMap") {
            let viewController = segue.destinationViewController as! JCICRDirectionsViewController
            viewController.batteryName = self.batteryName
        }
        
        if(segue.identifier == "DetailToJobCard") {
            let viewController = segue.destinationViewController as! JCICRJobCardViewController
            viewController.batteryName = self.batteryName
        }
    }


}

