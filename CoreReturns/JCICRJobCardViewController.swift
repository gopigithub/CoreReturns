//
//  JCICRJobCardViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRJobCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var lblBatteryNo: UILabel!
    @IBOutlet var tblCardTableView: UITableView!
    let descritpion = ["Scan Pallets", "Record any Overage/Damage","View BOL","Capture Signature"]
    let image = ["barcode","damageReport","dollar","digitalSign"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblCardTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tblCardTableView.dataSource = self
        self.tblCardTableView.delegate = self
        self.tblCardTableView.bounces = false
        self.tblCardTableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.setNavigationItemTitle("Job Card")
        self.setDriverInfoButton()


    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: JCICRCustomJobCardTableViewCell! = tableView.dequeueReusableCellWithIdentifier("customJobCardCell") as? JCICRCustomJobCardTableViewCell
        if cell == nil {
            self.tblCardTableView.registerNib(UINib(nibName: "JCICRCustomJobCardTableViewCell", bundle: nil), forCellReuseIdentifier: "customJobCardCell")
            cell = (self.tblCardTableView.dequeueReusableCellWithIdentifier("customJobCardCell") as? JCICRCustomJobCardTableViewCell)!
        }
        let image = UIImage(named: self.image[indexPath.row])
        cell.cardImage.image = image
        cell.cardDescription.text = self.descritpion[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row)
        {
        case 0:
            self.performSegueWithIdentifier("CardToScanPallet", sender: self)
        case 1:
            self.performSegueWithIdentifier("CardToDamageReport", sender: self)
        case 2:
            self.performSegueWithIdentifier("CardToBarcode", sender: self)
        case 3:
            self.performSegueWithIdentifier("CardToDigitalSign", sender: self)
        default:
            break
            
        }
    }

}
