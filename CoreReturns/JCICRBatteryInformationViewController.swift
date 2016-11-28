//
//  JCICRBatteryInformationViewController.swift
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

class JCICRBatteryInformationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddNewBatteryDeleagate,UITextFieldDelegate{
    
    @IBOutlet weak var tblBatteryInfo: UITableView!
    @IBOutlet weak var lblBatteryNo: UILabel!
    @IBOutlet weak var btnAddBattery: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var batteryName : String = String()
    
    var selectedSection = Int()
    
    let sections = [ "Battery Information1","Battery Information2"]
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

        
//        
//        let objJCICRCorePickUpInfoModel1 = JCICRCorePickUpInfoModel()
//        objJCICRCorePickUpInfoModel1.sections = "Battery Information"
        
   
        
        let objJCICRCorePickUpInfoModel2 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel2.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel2.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel2.keyBoardType = textFieldKeyBoardType.popOver
        
        
        let objJCICRCorePickUpInfoModel3 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel3.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel3.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel3.keyBoardType = textFieldKeyBoardType.editableWithButton
        
        
        let objJCICRCorePickUpInfoModel4 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel4.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel4.rightDataSource = "2"
        objJCICRCorePickUpInfoModel4.keyBoardType = textFieldKeyBoardType.editableWithoutButton
        
        
        let objJCICRCorePickUpInfoModel5 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel5.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel5.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel5.keyBoardType = textFieldKeyBoardType.popOver
        
        
       // self.sectionInfoItems.append(objJCICRCorePickUpInfoModel1)
        
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel2)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel3)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel4)
        self.customerInfoItems.append(objJCICRCorePickUpInfoModel5)
        
        self.dataSource.append(self.customerInfoItems)
        
        
        
        let objJCICRCorePickUpInfoModel6 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel6.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel6.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel6.keyBoardType = textFieldKeyBoardType.popOver
        
        
        let objJCICRCorePickUpInfoModel7 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel7.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel7.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel7.keyBoardType = textFieldKeyBoardType.editableWithButton
        
        
        let objJCICRCorePickUpInfoModel8 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel8.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel8.rightDataSource = "2"
        objJCICRCorePickUpInfoModel8.keyBoardType = textFieldKeyBoardType.editableWithoutButton
        
        
        let objJCICRCorePickUpInfoModel9 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel9.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel9.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel9.keyBoardType = textFieldKeyBoardType.popOver
        
        
        // self.sectionInfoItems.append(objSectionName1)
        
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel6)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel7)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel8)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel9)
        
        
        self.dataSource.append(self.batteryInfoItems)
        
        self.tblBatteryInfo.reloadData()
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    
    @IBAction func AddMoreBatteryBtnTapped(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let objJCICRBatteryPickUpInfoViewController = storyboard.instantiateViewControllerWithIdentifier("corePickupAlertViewController") as! JCICRBatteryPickUpInfoViewController
        objJCICRBatteryPickUpInfoViewController.delegate = self

        self.showCorePickupAlertView(objJCICRBatteryPickUpInfoViewController)
    }
    
    
    @IBAction func SaveNextBtnTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("coreReturnsToDigitalSign", sender: self)
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        switch textField.tag{
            
        case 2:
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc = storyboard.instantiateViewControllerWithIdentifier("PopoverViewController") as! JCICRBatteryPickUpPopOverViewController
                vc.delegate = self
                vc.modalPresentationStyle = UIModalPresentationStyle.Popover
                vc.popoverPresentationController?.sourceView = textField
                vc.popoverPresentationController?.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
            
            let popover: UIPopoverPresentationController = vc.popoverPresentationController!
                popover.sourceView = textField
                popover.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
                popover.permittedArrowDirections = UIPopoverArrowDirection.Any
                vc.preferredContentSize = CGSize(width: 300, height: 250)
                presentViewController(vc, animated: true, completion:nil)
            
        default:
            break
            
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        textField.resignFirstResponder()
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
        
        
//        if (isAddBatteryTapped) {
//            return sectionInfoItems.count
//        }
//        else {
            return self.sections.count
//        }
        
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
        cell.selectionStyle = UITableViewCellSelectionStyle.None
       
        
        return cell
    }
 
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let myView = UIView()
        myView.frame = CGRectMake(0, 0, 100, 100)
        myView.backgroundColor = UIColor(red: 32/255.0, green: 161/255.0, blue: 149/255.0, alpha: 1.0)
        
        
        let myLbl = UILabel()
        myLbl.frame = CGRectMake(240, 2, 300, 25)
        myLbl.backgroundColor = UIColor.clearColor()
        let title = self.tableView(tableView, titleForHeaderInSection: section)!
        myLbl.text = title
        myLbl.textColor = UIColor.whiteColor()
        myLbl.textAlignment = .Center
        
        
        let deleteBtn = UIButton()
        deleteBtn.frame = CGRectMake(700, 5, 20, 20)
        deleteBtn.tag = section
        deleteBtn.setImage(UIImage(named: "btnDelete"), forState: UIControlState.Normal)
        deleteBtn.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        deleteBtn.addTarget(self, action: "deleteSection:", forControlEvents: UIControlEvents.TouchUpInside)
        
        myView.addSubview(deleteBtn)
        myView.addSubview(myLbl)
        return myView
     
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
           // return "BATTERY INFORMATION 1"
        
     return self.sections[section]
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedSection = indexPath.section
        print(selectedSection)
    }
    func deleteSection(sender:UIButton) {
        print("section deleted")
        let clickedButton = (sender )
        print(clickedButton)
        
        UIView.animateWithDuration(0.5, delay: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            self.dataSource.removeAtIndex(clickedButton.tag)
            
            }, completion: { (finished: Bool) -> Void in
                
                // you can do this in a shorter, more concise way by setting the value to its opposite, NOT value
                 self.tblBatteryInfo.reloadData()
        })
        

        
        
    }
    
    func AddNewBattery() {
        self.isAddBatteryTapped = true
        
        
//        let objSectionName1 = JCICRCorePickUpInfoModel()
//        objSectionName1.sections = "Battery Information"
        

        
        let objJCICRCorePickUpInfoModel6 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel6.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel6.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel6.keyBoardType = textFieldKeyBoardType.popOver

        
        let objJCICRCorePickUpInfoModel7 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel7.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel7.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel7.keyBoardType = textFieldKeyBoardType.editableWithButton

        
        let objJCICRCorePickUpInfoModel8 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel8.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel8.rightDataSource = "2"
        objJCICRCorePickUpInfoModel8.keyBoardType = textFieldKeyBoardType.editableWithoutButton

        
        let objJCICRCorePickUpInfoModel9 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel9.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel9.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel9.keyBoardType = textFieldKeyBoardType.popOver

        
       // self.sectionInfoItems.append(objSectionName1)
        
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel6)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel7)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel8)
        self.batteryInfoItems.append(objJCICRCorePickUpInfoModel9)

        
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
