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
    
    var selectedIndexPath: NSIndexPath!
    
    var sectionNameValue = Int()
    
    let sections = [ "Battery Information 1","Battery Information 2"]
    var isAddBatteryTapped = false
    var sectionInfoItems : [JCICRCorePickUpInfoModel] = []
    var customerInfoItems : [JCICRCorePickUpInfoModel] = []
    var batteryInfoItems : [JCICRPickUpBatteryModel] = []
    var dataSource : [[JCICRPickUpBatteryModel]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionNameValue = 2

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
        let objPickUP1 = JCICRPickUpBatteryModel()
        
        let objJCICRCorePickUpInfoModel1 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel1.sections = "Battery Information 1"
        
        
   
        
        let objJCICRCorePickUpInfoModel2 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel2.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel2.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel2.keyBoardType = textFieldKeyBoardType.etnPopOver
        objPickUP1.etnNumber = objJCICRCorePickUpInfoModel2
       
        
        
        let objJCICRCorePickUpInfoModel3 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel3.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel3.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel3.keyBoardType = textFieldKeyBoardType.editableWithButton
        objPickUP1.skuNumber = objJCICRCorePickUpInfoModel3
        
        
        let objJCICRCorePickUpInfoModel4 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel4.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel4.rightDataSource = "2"
        objJCICRCorePickUpInfoModel4.keyBoardType = textFieldKeyBoardType.editableWithoutButton
        objPickUP1.quantity = objJCICRCorePickUpInfoModel4
        
        
        let objJCICRCorePickUpInfoModel5 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel5.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel5.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel5.keyBoardType = textFieldKeyBoardType.condtionPopOVer
        objPickUP1.condtion = objJCICRCorePickUpInfoModel5
        
        
        self.sectionInfoItems.append(objJCICRCorePickUpInfoModel1)

        
        self.batteryInfoItems.append(objPickUP1)
        
        self.dataSource.append(self.batteryInfoItems)
        
        let objPickUP2 = JCICRPickUpBatteryModel()
        
        let objJCICRCorePickUpInfoModelSection = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModelSection.sections = "Battery Information 2"
        
        
        let objJCICRCorePickUpInfoModel6 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel6.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel6.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel6.keyBoardType = textFieldKeyBoardType.etnPopOver
        objPickUP2.etnNumber = objJCICRCorePickUpInfoModel6
        
        
        let objJCICRCorePickUpInfoModel7 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel7.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel7.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel7.keyBoardType = textFieldKeyBoardType.editableWithButton
        objPickUP2.skuNumber = objJCICRCorePickUpInfoModel7
        
        
        let objJCICRCorePickUpInfoModel8 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel8.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel8.rightDataSource = "2"
        objJCICRCorePickUpInfoModel8.keyBoardType = textFieldKeyBoardType.editableWithoutButton
        objPickUP2.quantity = objJCICRCorePickUpInfoModel8
        
        
        let objJCICRCorePickUpInfoModel9 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel9.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel9.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel9.keyBoardType = textFieldKeyBoardType.condtionPopOVer
        objPickUP2.condtion = objJCICRCorePickUpInfoModel9
        
        
         self.sectionInfoItems.append(objJCICRCorePickUpInfoModelSection)
        

        self.batteryInfoItems.append(objPickUP2)
        
        
        self.dataSource.append(self.batteryInfoItems)
        
        self.tblBatteryInfo.reloadData()
        
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    func btnAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let objJCICRBatteryPickUpInfoViewController = storyboard.instantiateViewControllerWithIdentifier("corePickupAlertViewController") as! JCICRBatteryPickUpInfoViewController
        showCorePickupAlertView(objJCICRBatteryPickUpInfoViewController)
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
        
        if let superview = textField.superview {
            if let cell = superview.superview as? JCICRCustomCustomerInfoTableViewCell {
                selectedIndexPath = tblBatteryInfo.indexPathForCell(cell)
            }
        }
        
        switch textField.tag{
            
        case 2:
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc = storyboard.instantiateViewControllerWithIdentifier("PopoverViewController") as! JCICRBatteryPickUpPopOverViewController
                vc.delegate = self
            vc.isETNTapped = true
                vc.modalPresentationStyle = UIModalPresentationStyle.Popover
                vc.popoverPresentationController?.sourceView = textField
                vc.popoverPresentationController?.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
            
            let popover: UIPopoverPresentationController = vc.popoverPresentationController!
                popover.sourceView = textField
                popover.sourceRect = CGRectMake(CGRectGetMidX(textField.bounds), CGRectGetMidY(textField.bounds),0,0)
                popover.permittedArrowDirections = UIPopoverArrowDirection.Any
                vc.preferredContentSize = CGSize(width: 300, height: 250)
                presentViewController(vc, animated: true, completion:nil)
        case 3:
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc = storyboard.instantiateViewControllerWithIdentifier("PopoverViewController") as! JCICRBatteryPickUpPopOverViewController
            vc.delegate = self
            vc.isETNTapped = false
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
        return false
        
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
       // return self.dataSource[section].count
        return 4
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.dataSource.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: JCICRCustomCustomerInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell
        if cell == nil {
            self.tblBatteryInfo.registerNib(UINib(nibName: "JCICRCustomCustomerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customCustomerInfoCell")
            cell = (self.tblBatteryInfo.dequeueReusableCellWithIdentifier("customCustomerInfoCell") as? JCICRCustomCustomerInfoTableViewCell)!
        }
        
        let objJCICorePickUpInfoModel : JCICRPickUpBatteryModel = self.dataSource[indexPath.section][0]
        switch(indexPath.row) {
        case 0:
             cell.lblInfo.text = objJCICorePickUpInfoModel.etnNumber.leftDataSource
            cell.txtDescription.text = objJCICorePickUpInfoModel.etnNumber.rightDataSource
            cell.txtDescription.tag = objJCICorePickUpInfoModel.etnNumber.keyBoardType.rawValue
            cell.setTextFieldType(objJCICorePickUpInfoModel.etnNumber.keyBoardType,viewcontrollerRef: self)


        case 1:
            cell.lblInfo.text = objJCICorePickUpInfoModel.skuNumber.leftDataSource
            cell.txtDescription.text = objJCICorePickUpInfoModel.skuNumber.rightDataSource
            cell.txtDescription.tag = objJCICorePickUpInfoModel.skuNumber.keyBoardType.rawValue
            cell.setTextFieldType(objJCICorePickUpInfoModel.skuNumber.keyBoardType,viewcontrollerRef: self)
 
        case 2:
            cell.lblInfo.text = objJCICorePickUpInfoModel.quantity.leftDataSource
            cell.txtDescription.text = objJCICorePickUpInfoModel.quantity.rightDataSource
            cell.txtDescription.tag = objJCICorePickUpInfoModel.quantity.keyBoardType.rawValue
            cell.setTextFieldType(objJCICorePickUpInfoModel.quantity.keyBoardType,viewcontrollerRef: self)

            
        case 3:
            cell.lblInfo.text = objJCICorePickUpInfoModel.condtion.leftDataSource
            cell.txtDescription.text = objJCICorePickUpInfoModel.condtion.rightDataSource
            cell.txtDescription.tag = objJCICorePickUpInfoModel.condtion.keyBoardType.rawValue
            cell.setTextFieldType(objJCICorePickUpInfoModel.condtion.keyBoardType,viewcontrollerRef: self)
            
        default:
            break
            
            
        }
       
        cell.lblInfo.userInteractionEnabled = false
        cell.txtDescription.delegate = self
 
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
        
        return self.sectionInfoItems[section].sections
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    func deleteSection(sender:UIButton) {
        let clickedButton = (sender )
        
        UIView.animateWithDuration(0.5, delay: 1.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            self.dataSource.removeAtIndex(clickedButton.tag)
            
            }, completion: { (finished: Bool) -> Void in

                 self.tblBatteryInfo.reloadData()
        })
        

        
        
    }
    
    func AddNewBattery() {
        
        self.isAddBatteryTapped = true
        let objPickUP3 = JCICRPickUpBatteryModel()
        
        sectionNameValue = sectionNameValue + 1
        let objSectionName1 = JCICRCorePickUpInfoModel()
        objSectionName1.sections = "Battery Information \(sectionNameValue)"
        

        
        let objJCICRCorePickUpInfoModel6 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel6.leftDataSource = "ETN"
        objJCICRCorePickUpInfoModel6.rightDataSource = "OPTIMA"
        objJCICRCorePickUpInfoModel6.keyBoardType = textFieldKeyBoardType.etnPopOver
        objPickUP3.etnNumber = objJCICRCorePickUpInfoModel6

        
        let objJCICRCorePickUpInfoModel7 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel7.leftDataSource = "SKU Number"
        objJCICRCorePickUpInfoModel7.rightDataSource = "680500100 OPTIMA® AGM batteries"
        objJCICRCorePickUpInfoModel7.keyBoardType = textFieldKeyBoardType.editableWithButton
        objPickUP3.skuNumber = objJCICRCorePickUpInfoModel7

        
        let objJCICRCorePickUpInfoModel8 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel8.leftDataSource = "Quantity"
        objJCICRCorePickUpInfoModel8.rightDataSource = "4"
        objJCICRCorePickUpInfoModel8.keyBoardType = textFieldKeyBoardType.editableWithoutButton
        objPickUP3.quantity = objJCICRCorePickUpInfoModel8

        
        let objJCICRCorePickUpInfoModel9 = JCICRCorePickUpInfoModel()
        objJCICRCorePickUpInfoModel9.leftDataSource = "Conditon"
        objJCICRCorePickUpInfoModel9.rightDataSource = "Working"
        objJCICRCorePickUpInfoModel9.keyBoardType = textFieldKeyBoardType.condtionPopOVer
        objPickUP3.condtion = objJCICRCorePickUpInfoModel9

        
        self.sectionInfoItems.append(objSectionName1)

        self.batteryInfoItems.append(objPickUP3)

        self.dataSource.append(self.batteryInfoItems)
        self.tblBatteryInfo.reloadData()
        
    }
    
    func popOverValueClicked(tappedValue:String,selectedIndex:Int) {
            let indexPath = NSIndexPath(forRow: selectedIndexPath.row, inSection: selectedIndexPath.section)
          let cell = ((tblBatteryInfo as UITableView).cellForRowAtIndexPath(indexPath)! as!
            JCICRCustomCustomerInfoTableViewCell)
        
        cell.txtDescription.text = tappedValue
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "coreReturnsToDigitalSign") {
            let viewController = segue.destinationViewController as! JCICRDigitalSignatureViewController
            viewController.isFromCoreReturns = true
            viewController.batteryName = batteryName
        }
    }
}
