//
//  JCICRDigitalSignatureViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit

class JCICRDigitalSignatureViewController: UIViewController,UIAlertViewDelegate {

    @IBOutlet var digitalSignatureView: UIImageView!
    var batteryName : String = String()
    var mouseSwiped = false
    var mouseMoved = 0
    var point = CGPoint.zero
    var alert = UIAlertView()

    @IBOutlet weak var lblBatteryNo: UILabel!
    
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var btnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = UIAlertView()
        self.alert.delegate = self
        
        
        self.btnSave.layer.cornerRadius = 1
        self.btnSave.layer.borderWidth = 1
        self.btnSave.layer.masksToBounds = false
        self.btnSave.layer.borderColor = UIColor.blackColor().CGColor
        
        self.btnCancel.layer.cornerRadius = 1
        self.btnCancel.layer.borderWidth = 1
        self.btnCancel.layer.masksToBounds = false
        self.btnCancel.layer.borderColor = UIColor.blackColor().CGColor
        self.lblBatteryNo.text = self.batteryName
        
        self.setNavigationItemTitle("Capture Signature")
        self.setDriverInfoButton()
        mouseMoved = 0
    }

    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mouseSwiped = false
        let touch = touches.first!
        if touch.tapCount == 2 {
            digitalSignatureView.image = nil
            return
        }
        point = touch.locationInView(self.view)
        point.y -= 20
    }

    override func touchesMoved(touches: Set<UITouch>,
        withEvent event: UIEvent?) {
            
            mouseSwiped = true
            let touch = touches.first!
            var currentPoint = touch.locationInView(self.view)
            currentPoint.y -= 20
            UIGraphicsBeginImageContext(self.view.frame.size)
            digitalSignatureView.image?.drawInRect(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), CGLineCap.Round)
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0)
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0)
            CGContextBeginPath(UIGraphicsGetCurrentContext())
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), point.x, point.y)
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y)
            CGContextStrokePath(UIGraphicsGetCurrentContext())
            digitalSignatureView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            point = currentPoint
            mouseMoved += 1
            if mouseMoved == 10 {
                mouseMoved = 0
            }
            
    }
    
    
    @IBAction func btnSaveTapped(sender: AnyObject) {
        self.alert.title = "Sucess"
        self.alert.message = "Your Signature is saved"
        self.alert.addButtonWithTitle("OK")
        self.alert.show()
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){

        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as! JCICRHomeViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func btnCancelTapped(sender: AnyObject) {
        digitalSignatureView.image = nil
    }
}
