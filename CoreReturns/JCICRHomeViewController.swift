//
//  JCICRHomeViewController.swift
//  CoreReturns
//
//  Created by Mobility on 05/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblPickupDelivery: UITableView!
    let items : [String] = ["846902376327102","847562376327102","846902312347103","8567876327104","846902376753152","846902376321538","846902468727112","846902312345098","846902377169202","875631376327100"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblPickupDelivery.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblPickupDelivery.dataSource = self
        self.tblPickupDelivery.delegate = self
        self.tblPickupDelivery.bounces = false
        self.tblPickupDelivery.separatorStyle = .SingleLine
        self.tblPickupDelivery?.tableFooterView = UIView(frame: CGRectZero)

        
        
        self.setNavigationBar()
        self.setDriverInfoButton()

    }
    func setNavigationBar() {
        
        let backButton = UIBarButtonItem(title: "Pickup and Delivery List", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        if let font = UIFont(name: "HelveticaNeue", size: 18) {
            backButton.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
        
        navigationItem.leftBarButtonItem = backButton
        self.navigationItem.hidesBackButton = true
        
        
        self.setNavigationItemTitle("")
    }
  
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: JCICRCustomPickUPTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customPickUpCell") as? JCICRCustomPickUPTableViewCell
        if cell == nil {
            self.tblPickupDelivery.registerNib(UINib(nibName: "JCICRCustomPickUPTableViewCell", bundle: nil), forCellReuseIdentifier: "customPickUpCell")
            cell = (self.tblPickupDelivery.dequeueReusableCellWithIdentifier("customPickUpCell") as? JCICRCustomPickUPTableViewCell)!
        }
        cell.lblBatteryNo.text = self.items[indexPath.row]
        if (((indexPath.row)==2) || ((indexPath.row)==4)) {
            cell.imgDelivery.hidden = true
        }
        else if (((indexPath.row)==1) || ((indexPath.row)==3)) {
            cell.imgPickUp.hidden = true
        }
        else if (((indexPath.row)==7) || ((indexPath.row)==9)) {
            cell.imgDelivery.hidden = true
            cell.imgPickUp.hidden = true
        }
        else  {
            cell.imgPickUp.hidden = false
            cell.imgDelivery.hidden = false
        }
        cell.selectionStyle = .None
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        self.performSegueWithIdentifier("showDetailTable", sender: self)


    }

}
