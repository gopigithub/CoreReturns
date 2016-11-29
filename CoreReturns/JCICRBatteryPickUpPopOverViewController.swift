//
//  JCICRBatteryPickUpPopOverViewController.swift
//  CoreReturns
//
//  Created by Mobility on 24/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRBatteryPickUpPopOverViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblPopOver: UITableView!
     var items: [String] = ["We", "Heart", "Swift"]
    
    var isETNTapped : Bool = false
     var delegate : AddNewBatteryDeleagate?
    var dataSource : [JCICRCorePickUpPopOverModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSource()
        self.tblPopOver.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblPopOver.dataSource = self
        self.tblPopOver.delegate = self
        self.tblPopOver.bounces = false
        self.tblPopOver.tableFooterView = UIView(frame: CGRectZero)
    }
    func setDataSource() {
        
       if(isETNTapped) {
            let objJCICRCorePopOver1 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver1.data = "VARTA"
        
            let objJCICRCorePopOver2 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver2.data = "OPTIMA"
        
            let objJCICRCorePopOver3 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver3.data = "LTH"
        
            let objJCICRCorePopOver4 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver4.data = "Hellar"
        
            let objJCICRCorePopOver5 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver5.data = "MAC"
        
            let objJCICRCorePopOver6 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver6.data = "Delkor"
        
            self.dataSource.append(objJCICRCorePopOver1)
            self.dataSource.append(objJCICRCorePopOver2)
            self.dataSource.append(objJCICRCorePopOver3)
            self.dataSource.append(objJCICRCorePopOver4)
            self.dataSource.append(objJCICRCorePopOver5)
            self.dataSource.append(objJCICRCorePopOver6)
        }
        else {
        
            let objJCICRCorePopOver7 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver7.data = "Working"
        
            let objJCICRCorePopOver8 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver8.data = "Damaged"
        
            let objJCICRCorePopOver9 = JCICRCorePickUpPopOverModel()
            objJCICRCorePopOver9.data = "Dead"
        
            self.dataSource.append(objJCICRCorePopOver7)
            self.dataSource.append(objJCICRCorePopOver8)
            self.dataSource.append(objJCICRCorePopOver9)
        
        }
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = (self.tblPopOver?.dequeueReusableCellWithIdentifier("cell"))!
        
             let objJCICRCorePopOver : JCICRCorePickUpPopOverModel = self.dataSource[indexPath.row]
                cell.textLabel?.text = objJCICRCorePopOver.data
                cell.textLabel?.textColor = UIColor.blackColor()
        
            return cell
    
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 
        let cell = ((tblPopOver as UITableView).cellForRowAtIndexPath(indexPath)! )
        let tmpTappedValue = cell.textLabel?.text
        let currentIndex = indexPath.row
        delegate?.popOverValueClicked(tmpTappedValue!, selectedIndex: currentIndex)
    }

}
