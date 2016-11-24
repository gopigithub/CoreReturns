//
//  JCICRBatteryInfoViewController.swift
//  CoreReturns
//
//  Created by Mobility on 05/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit


class JCICRBatteryInfoViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate {

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
    var isEditBtnTapped = false

    
    let objJCICRHomeViewController = JCICRHomeViewController()

    var sections = [ "Delivery Information","General Information","Battery Information"]
    
    var deliveryInfoItems : [JCICRBatteryInfoModel] = []
    var generalInfoItems : [JCICRBatteryInfoModel] = []
    var batteryInfoItems : [JCICRBatteryInfoModel] = []
    var dataSource : [[JCICRBatteryInfoModel]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSource()
        self.isEditBtnTapped = false
        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.setButtonProperties()
        
        self.tblDetailBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblDetailBatteryInfo.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        self.tblDetailBatteryInfo.bounces = false
        self.tblDetailBatteryInfo?.tableFooterView = UIView(frame: CGRectZero)
        
        self.lblBatteryNo.text = self.batteryName

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setDataSource() {
        
         let objJCICRBatteryInfoModel1 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel1.leftDataSource = "Name"
        objJCICRBatteryInfoModel1.rightDataSource = "Dr. Irene Mary Walker(Irene)"
        
        
         let objJCICRBatteryInfoModel2 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel2.leftDataSource = "Address"
        objJCICRBatteryInfoModel2.rightDataSource = "Residence No.1N, 7301 Country Club Dr, Downmey California - 90241, United States"
        
        
         let objJCICRBatteryInfoModel3 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel3.leftDataSource = "Mobile"
        objJCICRBatteryInfoModel3.rightDataSource = "+1 562 127 2090"
        
        
         let objJCICRBatteryInfoModel4 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel4.leftDataSource = "Email"
        objJCICRBatteryInfoModel4.rightDataSource = "irenewalker@gmail.com"
        
        let objJCICRBatteryInfoModel5 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel5.leftDataSource = "Pickup Date"
        objJCICRBatteryInfoModel5.rightDataSource = "11/19/2016"
        
        let objJCICRBatteryInfoModel6 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel6.leftDataSource = "Delivery Date"
        objJCICRBatteryInfoModel6.rightDataSource = "11/19/2016"
        
        let objJCICRBatteryInfoModel7 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel7.leftDataSource = "Quantity"
        objJCICRBatteryInfoModel7.rightDataSource = "4 OPTIMA® AGM batteries 2 LTH® batteries 2"
        
        let objJCICRBatteryInfoModel8 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel8.leftDataSource = "ETN"
        objJCICRBatteryInfoModel8.rightDataSource = "680500100 OPTIMA® AGM batteries"
        
        let objJCICRBatteryInfoModel9 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel9.leftDataSource = "Voltage"
        objJCICRBatteryInfoModel9.rightDataSource = "12V"
        
        let objJCICRBatteryInfoModel10 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel10.leftDataSource = "Capacity"
        objJCICRBatteryInfoModel10.rightDataSource = "180Ah"
        
        let objJCICRBatteryInfoModel11 = JCICRBatteryInfoModel()
        objJCICRBatteryInfoModel11.leftDataSource = "Weight"
        objJCICRBatteryInfoModel11.rightDataSource = "45kg"
        
        
        self.deliveryInfoItems.append(objJCICRBatteryInfoModel1)
        self.deliveryInfoItems.append(objJCICRBatteryInfoModel2)
        self.deliveryInfoItems.append(objJCICRBatteryInfoModel3)
        self.deliveryInfoItems.append(objJCICRBatteryInfoModel4)
        self.generalInfoItems.append(objJCICRBatteryInfoModel5)
        self.generalInfoItems.append(objJCICRBatteryInfoModel6)
        self.generalInfoItems.append(objJCICRBatteryInfoModel7)
        self.batteryInfoItems.append(objJCICRBatteryInfoModel8)
        self.batteryInfoItems.append(objJCICRBatteryInfoModel9)
        self.batteryInfoItems.append(objJCICRBatteryInfoModel10)
        self.batteryInfoItems.append(objJCICRBatteryInfoModel11)
        
        
        self.dataSource.append(self.deliveryInfoItems)
        self.dataSource.append(self.generalInfoItems)
        self.dataSource.append(self.batteryInfoItems)
   
    }
    
    func setButtonProperties() {
        
        self.btnGetDirections.layer.cornerRadius = 5
        self.btnGetDirections.layer.borderWidth = 1
        self.btnGetDirections.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnJobCard.layer.cornerRadius = 5
        self.btnJobCard.layer.borderWidth = 1
        self.btnJobCard.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnCancel.layer.cornerRadius = 5
        self.btnCancel.layer.borderWidth = 1
        self.btnCancel.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnEdit.layer.cornerRadius = 5
        self.btnEdit.layer.borderWidth = 1
        self.btnEdit.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnSave.layer.cornerRadius = 5
        self.btnSave.layer.borderWidth = 1
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
        
        self.isEditBtnTapped = true
        self.tblDetailBatteryInfo.reloadData()
        
    }
    
    @IBAction func btnSaveTapped(sender: AnyObject) {
        
        self.isEditBtnTapped = false
        for(var sectionnum=0;sectionnum<self.dataSource.count;sectionnum++) {
            for(var rownum=0;rownum<self.dataSource[sectionnum].count;rownum++) {
                let indexPath = NSIndexPath(forRow: rownum, inSection: sectionnum)

                let cell = ((tblDetailBatteryInfo as UITableView).cellForRowAtIndexPath(indexPath)! as! JCICRCustomBatteryInfoTableViewCell)
                
                let objJCICRBatteryInfoModel : JCICRBatteryInfoModel = self.dataSource[indexPath.section][indexPath.row]
                
                objJCICRBatteryInfoModel.rightDataSource = cell.txtDescription.text
                self.dataSource[sectionnum][rownum] = objJCICRBatteryInfoModel
            }
        }
        self.tblDetailBatteryInfo.reloadData()

        
    }
    
    
    @IBAction func btnCancelTapped(sender: AnyObject) {
        
        delegate?.removeData(self.selectedIndexPath)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.dataSource[section].count
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell: JCICRCustomBatteryInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customBatteryInfoCell") as? JCICRCustomBatteryInfoTableViewCell
        if cell == nil {
            self.tblDetailBatteryInfo.registerNib(UINib(nibName: "JCICRCustomBatteryInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customBatteryInfoCell")
            cell = (self.tblDetailBatteryInfo.dequeueReusableCellWithIdentifier("customBatteryInfoCell") as? JCICRCustomBatteryInfoTableViewCell)!
            
  
        }
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        if(isEditBtnTapped) {
            cell.txtDescription.layer.borderWidth = 1
            cell.txtDescription.layer.cornerRadius = 5
            cell.txtDescription.backgroundColor = UIColor.whiteColor()
            cell.txtDescription.textColor = UIColor.blackColor()
            cell.userInteractionEnabled = true
        }
        else {
            cell.txtDescription.layer.borderWidth = 0
            cell.txtDescription.layer.cornerRadius = 0
            cell.txtDescription.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
            cell.txtDescription.textColor = UIColor.whiteColor()
            cell.userInteractionEnabled = false
            
        }
        let objJCICRBatteryInfoModel : JCICRBatteryInfoModel = self.dataSource[indexPath.section][indexPath.row]
        
        cell.lblInfomation.text = objJCICRBatteryInfoModel.leftDataSource
        cell.txtDescription.text = objJCICRBatteryInfoModel.rightDataSource
        
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

        return self.sections [section ]
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

