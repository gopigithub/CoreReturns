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
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    var batteryName:String = String()
     var delegate : RemoveTableDataSourceDelegate?
    var selectedIndexPath = Int()

    
    let objJCICRHomeViewController = JCICRHomeViewController()

    let sections = [ "Delivery Information","General Information","Battery Information"]
    
    let items = [
        ["Name","Address","Mobile","Email"],
        ["Pickup Date", "Delivery Date", "Quantity"],
        ["ETN", "Voltage", "Capacity","Weight"]]
    
    
    let itemDescription = [
         ["Dr. Irene Mary Walker(Irene)","Residence No.1N, 7301 Country Club Dr, Downmey California - 90241, United States","+1 562 127 2090","irenewalker@gmail.com"],
         ["11/19/2016","11/19/2016","4 OPTIMA® AGM batteries 2 LTH® batteries 2"],
        ["680500100 OPTIMA® AGM batteries","12V","180Ah","45kg"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblDetailBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblDetailBatteryInfo.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        self.tblDetailBatteryInfo.bounces = false
        self.tblDetailBatteryInfo?.tableFooterView = UIView(frame: CGRectZero)
        

        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.setButtonProperties()
        

        
        self.lblBatteryNo.text = self.batteryName

    }
    
    func setButtonProperties() {
        
        self.btnGetDirections.layer.cornerRadius = 5
        self.btnGetDirections.layer.borderWidth = 1
        self.btnGetDirections.layer.masksToBounds = false
        self.btnGetDirections.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnJobCard.layer.cornerRadius = 5
        self.btnJobCard.layer.borderWidth = 1
        self.btnJobCard.layer.masksToBounds = false
        self.btnJobCard.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnCancel.layer.cornerRadius = 5
        self.btnCancel.layer.borderWidth = 1
        self.btnCancel.layer.masksToBounds = false
        self.btnCancel.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnEdit.layer.cornerRadius = 5
        self.btnEdit.layer.borderWidth = 1
        self.btnEdit.layer.masksToBounds = false
        self.btnEdit.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnSave.layer.cornerRadius = 5
        self.btnSave.layer.borderWidth = 1
        self.btnSave.layer.masksToBounds = false
        self.btnSave.layer.borderColor = UIColor.blackColor().CGColor
        
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
    
    @IBAction func btnEditTapped(sender: AnyObject) {
        
    }
    
    @IBAction func btnSaveTapped(sender: AnyObject) {
    }
    
    
    @IBAction func btnCancelTapped(sender: AnyObject) {
        
        delegate?.removeData(self.selectedIndexPath)
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
        cell.txtDescription?.text = self.itemDescription[indexPath.section][indexPath.row]
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
            sectionName = "Delivery Information"
        case 1:
            sectionName = "General Information"
        case 2:
            sectionName = "Battery Information"
         
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

