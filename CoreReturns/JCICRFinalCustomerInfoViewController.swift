//
//  JCICRFinalCustomerInfoViewController.swift
//  CoreReturns
//
//  Created by Mobility on 25/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRFinalCustomerInfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var sections = ["Customer Information","CRN Information"]
    var customerItems :[JCICRCustomerInfoModel] = []
    var crnItems : [JCICRCustomerInfoModel] = []
    var dataSource : [[JCICRCustomerInfoModel]] = []
    var delegate : RemoveTableDataSourceDelegate?
    var selectedIndexPath = Int()
    
    @IBOutlet weak var tblInfo: UITableView!
    @IBOutlet weak var btnFinish: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()
        self.setDataSource()
        
        self.tblInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblInfo.dataSource = self
        self.tblInfo.delegate = self
        self.tblInfo.bounces = false
        self.tblInfo.tableFooterView = UIView(frame: CGRectZero)
        
        
        self.btnFinish.layer.cornerRadius = 5
        self.btnFinish.layer.borderWidth = 1
        self.btnFinish.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func setDataSource() {
        
        let objJCICRCustomerInfoModel = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel.leftDataSource = "ID"
        objJCICRCustomerInfoModel.rightDataSource = "6327102"
        objJCICRCustomerInfoModel.textFieldRightButton = textFieldRightView.nonEditable
        
        let objJCICRCustomerInfoModel1 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel1.leftDataSource = "Name"
        objJCICRCustomerInfoModel1.rightDataSource = "Dr.Irene Mary Walker (Irene)"
        objJCICRCustomerInfoModel1.textFieldRightButton = textFieldRightView.nonEditable

        
        let objJCICRCustomerInfoModel2 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel2.leftDataSource = "Address"
        objJCICRCustomerInfoModel2.rightDataSource = "Residence No.1N, 7301 Country Club Dr. Downey California - 90241, United States"
        objJCICRCustomerInfoModel2.textFieldRightButton = textFieldRightView.nonEditable

        
        let objJCICRCustomerInfoModel3 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel3.leftDataSource = "Mobile"
        objJCICRCustomerInfoModel3.rightDataSource = "+15621272090"
        objJCICRCustomerInfoModel3.textFieldRightButton = textFieldRightView.nonEditable

        
        
        let objJCICRCustomerInfoModel4 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel4.leftDataSource = "Email"
        objJCICRCustomerInfoModel4.rightDataSource = "irenewalker@gmail.com"
        objJCICRCustomerInfoModel4.textFieldRightButton = textFieldRightView.nonEditable

        
        let objJCICRCustomerInfoModel5 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel5.leftDataSource = "CRN No"
        objJCICRCustomerInfoModel5.rightDataSource = "23145678942536"
        objJCICRCustomerInfoModel5.textFieldRightButton = textFieldRightView.nonEditable

        
        let objJCICRCustomerInfoModel6 = JCICRCustomerInfoModel()
        objJCICRCustomerInfoModel6.leftDataSource = "Package No"
        objJCICRCustomerInfoModel6.rightDataSource = "985468680500100"
        objJCICRCustomerInfoModel6.textFieldRightButton = textFieldRightView.editable

        
        self.customerItems.append(objJCICRCustomerInfoModel)
        self.customerItems.append(objJCICRCustomerInfoModel1)
        self.customerItems.append(objJCICRCustomerInfoModel2)
        self.customerItems.append(objJCICRCustomerInfoModel3)
        self.customerItems.append(objJCICRCustomerInfoModel4)
        
        self.crnItems.append(objJCICRCustomerInfoModel5)
        self.crnItems.append(objJCICRCustomerInfoModel6)
        
        self.dataSource.append(self.customerItems)
        self.dataSource.append(self.crnItems)
        
    }
    func btnAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let objJCICRBatteryPickUpInfoViewController = storyboard.instantiateViewControllerWithIdentifier("corePickupAlertViewController") as! JCICRBatteryPickUpInfoViewController
        showCorePickupAlertView(objJCICRBatteryPickUpInfoViewController)
    }
    
    @IBAction func finishBtnTapped(sender: AnyObject) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("homeView") as! JCICRHomeViewController
        delegate?.removeData(selectedIndexPath)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell: JCICRCustomInfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customerInfoCell") as? JCICRCustomInfoTableViewCell
        if cell == nil {
            self.tblInfo.registerNib(UINib(nibName: "JCICRCustomInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customerInfoCell")
            cell = (self.tblInfo.dequeueReusableCellWithIdentifier("customerInfoCell") as? JCICRCustomInfoTableViewCell)!
            
            
        }
           let objJCICRCustomerInfoModel : JCICRCustomerInfoModel = self.dataSource[indexPath.section][indexPath.row]
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.lblInformation.text = objJCICRCustomerInfoModel.leftDataSource
        cell.txtDescription?.text = objJCICRCustomerInfoModel.rightDataSource
        cell.setTextFieldRightView(objJCICRCustomerInfoModel.textFieldRightButton, viewcontrollerRef: self)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
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
    
    

}
