//
//  JCICRCoreReturnsCustomerInfoViewController.swift
//  CoreReturns
//
//  Created by Vaibhav on 25/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRCoreReturnsCustomerInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationItemTitle("Battery and Delivery Info")
        self.setDriverInfoButton()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
