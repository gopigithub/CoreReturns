//
//  JCICRCoreReturnsInformationViewController.swift
//  CoreReturns
//
//  Created by Mobility on 21/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

protocol AddNewBatteryDeleagate  {
    func AddNewBattery()
    
}

class JCICRCoreReturnsInformationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddNewBatteryDeleagate{
    
    @IBOutlet weak var tblBatteryInfo: UITableView!
    @IBOutlet weak var lblBatteryNo: UILabel!
    @IBOutlet weak var btnAddBattery: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var batteryName : String = String()
    var objJCICRCoreReturnsPickUpInfoViewController  = JCICRCoreReturnsPickUpInfoViewController()
    
    let sections = [ "Customer Information","Battery Information"]

    
    let itemDescription = [
        ["6327102","Dr. Irene Mary Walker(Irene)","Residence No.1N, 7301 Country Club Dr. Downmey California - 90241 United States","+1 562 127 2090","irenewalker@gmail.com"],
        ["680500100", "OPTIMA® AGM batteries","12V","180Ah","45kg"]]
    
    
    var customerInfoItems : [JCICRCorePickUpInfoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        objJCICRCoreReturnsPickUpInfoViewController.delegate = self
        self.setDataSource()
        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.lblBatteryNo.text = self.batteryName
        
        self.tblBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblBatteryInfo.dataSource = self
        self.tblBatteryInfo.delegate = self
        self.tblBatteryInfo.bounces = false
        self.tblBatteryInfo.tableFooterView = UIView(frame: CGRectZero)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setDataSource() {
        
        let objJCICRCorePickUpInfoModel = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel.leftDataSource = "ID"
        objJCICRCorePickUpInfoModel.rightDataSource = "6327102"
        
        let objJCICRCorePickUpInfoModel1 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel1.leftDataSource = "Name"
        objJCICRCorePickUpInfoModel1.rightDataSource = "Dr. Irene Mary Walker(Irene)"
        
        let objJCICRCorePickUpInfoModel2 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel2.leftDataSource = "Address"
        objJCICRCorePickUpInfoModel2.rightDataSource = "Residence No.1N, 7301 Country Club Dr, Downmey California - 90241, United States"
        
        let objJCICRCorePickUpInfoModel3 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel3.leftDataSource = "Mobile"
        objJCICRCorePickUpInfoModel3.rightDataSource = "+1 562 127 2090"
        
        let objJCICRCorePickUpInfoModel4 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel4.leftDataSource = "Email"
        objJCICRCorePickUpInfoModel4.rightDataSource = "irenewalker@gmail.com"
        
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel1)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel2)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel3)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel4)
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    
    @IBAction func AddMoreBatteryBtnTapped(sender: AnyObject) {
        self.showCorePickupAlertView()
    }
    
    
    @IBAction func SaveNextBtnTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("coreReturnsToDigitalSign", sender: self)
    }
    


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customerInfoItems.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: JCICRCustomCustomerInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell
        if cell == nil {
            self.tblBatteryInfo.registerNib(UINib(nibName: "JCICRCustomCustomerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customCustomerInfoCell")
            cell = (self.tblBatteryInfo.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell)!
        }
        

        
        let objJCICorePickUpInfoModel : JCICRCorePickUpInfoModel = self.customerInfoItems[indexPath.row]
        
        cell.lblInfo.text = objJCICorePickUpInfoModel.leftDataSource
        cell.txtDescription.text = objJCICorePickUpInfoModel.rightDataSource
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cell.userInteractionEnabled = false
        
        return cell
    }
 
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myLbl = UILabel()
//        myLbl.frame = CGRectMake(20, 10, 100, 50)
//        myLbl.backgroundColor = UIColor(red: 32/255.0, green: 161/255.0, blue: 149/255.0, alpha: 1.0)
//        let title = self.tableView(tableView, titleForHeaderInSection: section)!
//        myLbl.text = title
//        myLbl.textColor = UIColor.whiteColor()
//        myLbl.textAlignment = .Center
//        return myLbl
//    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var sectionName: String
//        switch section {
//        case 0:
//            sectionName = "Customer Information"
//        case 1:
//            sectionName = "Battery Information"
//      
//        default:
//            sectionName = ""
//        }
//        
//        return sectionName
//    }
    
    func AddNewBattery() {
        print("Method Invoked")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "coreReturnsToDigitalSign") {
            let viewController = segue.destinationViewController as! JCICRDigitalSignatureViewController
            viewController.isFromCoreReturns = true
        }
    }
}
