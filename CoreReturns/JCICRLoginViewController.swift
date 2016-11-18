//
//  JCICRLoginViewController.swift
//  CoreReturns
//
//  Created by Mobility on 05/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRLoginViewController: UIViewController,UIAlertViewDelegate {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var switchRememberMe: UISwitch!
    @IBOutlet var btnSignIn: UIButton!
    
    let objJCICRDriverInfo = JCICRDriverInfoViewController()
    var alert = UIAlertView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = UIAlertView()
        self.alert.delegate = self
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.translucent = false

    }

    
    @IBAction func btnSignInTapped(sender: AnyObject) {
        
        if(self.txtUsername.text != "" && self.txtPassword.text != "") {
            self.alert.title = "Warning"
            self.alert.message = "Please enter your credentials"
            self.alert.addButtonWithTitle("OK")
            self.alert.show()
        }
        else if((self.txtUsername.text == "achandgo") || (self.txtPassword.text == "achandgo")) {
            self.alert.title = "Warning"
            self.alert.message = "Please enter valid credentials"
            self.alert.addButtonWithTitle("OK")
            self.alert.show()
        }
        else {
            self.performSegueWithIdentifier("LoginToHome", sender: self)
        }
    }


    @IBAction func switchRememberTapped(sender: AnyObject) {
    }
}

extension UIViewController {

    
    func setNavigationItemTitle(navigationTitle : String) {
        let view = UIView()
        self.navigationItem.titleView = view
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30/255.0, green: 189/255.0, blue: 178/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.topItem?.title = navigationTitle
    }
    func setDriverInfoButton() {
        let btnName = UIButton()
        btnName.setBackgroundImage(UIImage(named: "driver"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 25 , 25)
        btnName.addTarget(self, action: Selector("btnDriverInfoTapped:"), forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    func showDriverInformation() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewControllerWithIdentifier("driverInfoViewController") as! JCICRDriverInfoViewController
        viewController.view.frame = CGRectMake(0, 50, 100, 100)
        
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        let currentWindow = UIApplication.sharedApplication().keyWindow
        currentWindow!.addSubview(viewController.view)
        
    }
    
    private func addViewControllerAsChildViewController(viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        // Notify Child View Controller
        viewController.didMoveToParentViewController(self)
    }
    
    func removeDriverInformation() {
        self.view.removeFromSuperview()
    }
}

