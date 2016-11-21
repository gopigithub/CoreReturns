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
    var batteryName : String = String()
    var items: [String] = ["We", "Heart", "Swift"]

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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.backgroundColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        
        return cell
    }
    

}
