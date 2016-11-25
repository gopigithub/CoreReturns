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
    func popOverValueClicked(tappedValue:String,selectedIndex:Int)
    
}

class JCICRCoreReturnsInformationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddNewBatteryDeleagate,UITextFieldDelegate{
    
    @IBOutlet weak var tblBatteryInfo: UITableView!
    @IBOutlet weak var lblBatteryNo: UILabel!
    @IBOutlet weak var btnAddBattery: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var batteryName : String = String()
    
  //  let sections = [ "Customer Information","Battery Information"]
    var isAddBatteryTapped = false
    var sectionInfoItems : [JCICRCorePickUpInfoModel] = []
    var customerInfoItems : [JCICRCorePickUpInfoModel] = []
    var batteryInfoItems : [JCICRCorePickUpInfoModel] = []
    var dataSource : [[JCICRCorePickUpInfoModel]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDataSource()
        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.lblBatteryNo.text = self.batteryName
        
        self.tblBatteryInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        self.tblBatteryInfo.registerNib("JCICRCustomCorePickupSectionHeaderTableViewCell", forHeaderFooterViewReuseIdentifier: "customSectionHeader")
//        self.tblBatteryInfo.registerClass(JCICRCustomCorePickupSectionHeaderTableViewCell(), forCellReuseIdentifier: "customSectionHeader")
        
        
        
        let nib = UINib(nibName: "JCICRCustomCorePickupSectionHeaderTableViewCell", bundle: nil)
        self.tblBatteryInfo.registerNib(nib, forHeaderFooterViewReuseIdentifier: "customSectionHeader")
        self.tblBatteryInfo.dataSource = self
        self.tblBatteryInfo.delegate = self
        self.tblBatteryInfo.bounces = false
        self.tblBatteryInfo.tableFooterView = UIView(frame: CGRectZero)
        self.isAddBatteryTapped = false
        
    }
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
    }
    
    func setDataSource() {
        
//        let objSectionName = JCICRCorePickUpInfoModel()
//        objSectionName.sections = "CustomerInformation"
//        
//        let objJCICRCorePickUpInfoModel = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel.leftDataSource = "ID"
//        objJCICRCorePickUpInfoModel.rightDataSource = "6327102"
//        objJCICRCorePickUpInfoModel.keyBoardType = textFieldKeyBoardType.editable
//        
//        let objJCICRCorePickUpInfoModel1 = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel1.leftDataSource = "Name"
//        objJCICRCorePickUpInfoModel1.rightDataSource = "Dr. Irene Mary Walker(Irene)"
//        objJCICRCorePickUpInfoModel1.keyBoardType = textFieldKeyBoardType.editable
//
//        
//        let objJCICRCorePickUpInfoModel2 = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel2.leftDataSource = "Address"
//        objJCICRCorePickUpInfoModel2.rightDataSource = "Residence No.1N, 7301 Country Club Dr, Downmey California - 90241, United States"
//        objJCICRCorePickUpInfoModel2.keyBoardType = textFieldKeyBoardType.editable
//
//        
//        let objJCICRCorePickUpInfoModel3 = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel3.leftDataSource = "Mobile"
//        objJCICRCorePickUpInfoModel3.rightDataSource = "+1 562 127 2090"
//        objJCICRCorePickUpInfoModel3.keyBoardType = textFieldKeyBoardType.editable
//
//        
//        let objJCICRCorePickUpInfoModel4 = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel4.leftDataSource = "Email"
//        objJCICRCorePickUpInfoModel4.rightDataSource = "irenewalker@gmail.com"
//        objJCICRCorePickUpInfoModel4.keyBoardType = textFieldKeyBoardType.editable
//
//        
//        self.sectionInfoItems.append(objSectionName)
//        
//        self.customerInfoItems.append(objJCICRCorePickUpInfoModel)
//        self.customerInfoItems.append(objJCICRCorePickUpInfoModel1)
//        self.customerInfoItems.append(objJCICRCorePickUpInfoModel2)
//        self.customerInfoItems.append(objJCICRCorePickUpInfoModel3)
//        self.customerInfoItems.append(objJCICRCorePickUpInfoModel4)
//        self.dataSource.append(self.customerInfoItems)
        
        
        let objJCICRCorePickUpInfoModel1 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel1.sections = "Battery Information"
        
   
        
        let objJCICRCorePickUpInfoModel2 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel2.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel2.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel2.keyBoardType = textFieldKeyBoardType.popOver
        
        
        let objJCICRCorePickUpInfoModel3 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel3.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel3.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel3.keyBoardType = textFieldKeyBoardType.editable
        
        
        let objJCICRCorePickUpInfoModel4 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel4.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel4.rightDataSource = "2"
        objJCICRCorePickUpInfoModel4.keyBoardType = textFieldKeyBoardType.editable
        
        
        let objJCICRCorePickUpInfoModel5 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel5.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel5.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel5.keyBoardType = textFieldKeyBoardType.popOver
        
        
        self.sectionInfoItems.append(objJCICRCorePickUpInfoModel1)
        
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel2)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel3)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel4)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel5)
        
        self.dataSource.append(self.customerInfoItems)
        
        self.tblBatteryInfo.reloadData()
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    
    @IBAction func AddMoreBatteryBtnTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let objJCICRCoreReturnsPickUpInfoViewController = storyboard.instantiateViewControllerWithIdentifier("corePickupAlertViewController") as! JCICRCoreReturnsPickUpInfoViewController
        objJCICRCoreReturnsPickUpInfoViewController.delegate = self

        self.showCorePickupAlertView(objJCICRCoreReturnsPickUpInfoViewController)
    }
    
    
    @IBAction func SaveNextBtnTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("coreReturnsToDigitalSign", sender: self)
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        switch textField.tag{
            
        case 2:
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewControllerWithIdentifier("PopoverViewController") as! JCICRCoreReturnsPickUpPopOverViewController
//                vc.delegate = self
//                vc.modalPresentationStyle = UIModalPresentationStyle.Popover
//                vc.popoverPresentationController?.sourceView = textField
//                vc.popoverPresentationController?.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
//                dispatch_async(dispatch_get_main_queue(), ^{
// 
//                    
//                    let popover: UIPopoverPresentationController = vc.popoverPresentationController!
//                    
//                    popover.sourceView = textField
//                    popover.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
//                    popover.permittedArrowDirections = UIPopoverArrowDirection.Any
//                    let height = vc.dataSource.count * Int(vc.tblPopOver.rowHeight)
//                    vc.preferredContentSize = CGSize(width: 300, height: height)
//                    presentViewController(vc, animated: true, completion:nil)
//                    });
//                });
            
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
          dispatch_async(dispatch_get_main_queue(), {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("PopoverViewController") as! JCICRCoreReturnsPickUpPopOverViewController
            vc.delegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.Popover
            vc.popoverPresentationController?.sourceView = textField
            vc.popoverPresentationController?.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
//            let rowHeight = vc.tblPopOver.rowHeight
//            let height = vc.dataSource.count * Int(rowHeight)
//            vc.preferredContentSize = CGSize(width: 300, height: height)
        
        
                    
                    let popover: UIPopoverPresentationController = vc.popoverPresentationController!
                        popover.sourceView = textField
                        popover.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
                        popover.permittedArrowDirections = UIPopoverArrowDirection.Any

                        self.presentViewController(vc, animated: true, completion:nil)
                    
                })
                
                })
     
            
        default:
            break
            
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        if (isAddBatteryTapped) {
            return sectionInfoItems.count
        }
        else {
            return 1
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: JCICRCustomCustomerInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell
        if cell == nil {
            self.tblBatteryInfo.registerNib(UINib(nibName: "JCICRCustomCustomerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customCustomerInfoCell")
            cell = (self.tblBatteryInfo.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell)!
        }
        

        
        let objJCICorePickUpInfoModel : JCICRCorePickUpInfoModel = self.dataSource[indexPath.section][indexPath.row]
        
        cell.lblInfo.text = objJCICorePickUpInfoModel.leftDataSource
        cell.lblInfo.userInteractionEnabled = false
        cell.txtDescription.text = objJCICorePickUpInfoModel.rightDataSource
        cell.txtDescription.delegate = self
        cell.txtDescription.tag = objJCICorePickUpInfoModel.keyBoardType.rawValue
        cell.setTextFieldType(objJCICorePickUpInfoModel.keyBoardType)
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
       
        
        return cell
    }
 
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView()
        myView.frame = CGRectMake(50, 10, 100, 100)
        myView.backgroundColor = UIColor(red: 32/255.0, green: 161/255.0, blue: 149/255.0, alpha: 1.0)
        let myLbl = UILabel()
        myLbl.frame = CGRectMake(20, 10, 100, 50)
        myLbl.backgroundColor = UIColor.redColor()
        let title = self.tableView(tableView, titleForHeaderInSection: section)!
        myLbl.text = title
        myLbl.textColor = UIColor.whiteColor()
        myLbl.textAlignment = .Center
        myView.addSubview(myLbl)
        return myView
     
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
   
            
            return "BATTERY INFORMATION 1"
            
    
        
        
//     return self.sectionInfoItemsindexPath[section]
    }
    
    func AddNewBattery() {
        self.isAddBatteryTapped = true
        
        
        let objSectionName1 = JCICRCorePickUpInfoModel()
        objSectionName1.sections = "Battery Information"
        
        let objJCICRCorePickUpInfoModel6 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel6.leftDataSource = "CRN No"
        objJCICRCorePickUpInfoModel6.rightDataSource = "985468680500100"
        objJCICRCorePickUpInfoModel6.keyBoardType = textFieldKeyBoardType.nonEditable
        
        let objJCICRCorePickUpInfoModel7 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel7.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel7.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel7.keyBoardType = textFieldKeyBoardType.popOver

        
        let objJCICRCorePickUpInfoModel8 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel8.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel8.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel8.keyBoardType = textFieldKeyBoardType.editable

        
        let objJCICRCorePickUpInfoModel9 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel9.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel9.rightDataSource = "2"
        objJCICRCorePickUpInfoModel9.keyBoardType = textFieldKeyBoardType.editable

        
        let objJCICRCorePickUpInfoModel10 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel10.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel10.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel10.keyBoardType = textFieldKeyBoardType.popOver

        
        self.sectionInfoItems.append(objSectionName1)
        
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel6)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel7)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel8)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel9)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel10)

        
        self.dataSource.append(self.batteryInfoItems)
        
        self.tblBatteryInfo.reloadData()
        
    }
    
    func popOverValueClicked(tappedValue:String,selectedIndex:Int) {
            let indexPath = NSIndexPath(forRow: 0, inSection: 1)
          let cell = ((tblBatteryInfo as UITableView).cellForRowAtIndexPath(indexPath)! as!
            JCICRCustomCustomerInfoTableViewCell)
        
        cell.txtDescription.text = tappedValue
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "coreReturnsToDigitalSign") {
            let viewController = segue.destinationViewController as! JCICRDigitalSignatureViewController
            viewController.isFromCoreReturns = true
        }
    }
}
