//
//  JCICRBatteryPickUpInfoViewController.swift
//  CoreReturns
//
//  Created by Mobility on 23/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit
import AVFoundation

class JCICRBatteryPickUpInfoViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate {
    
    @IBOutlet weak var coreReturnsPickupAlertView: UIView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var btnManualEntry: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var topSeparatorView: UIView!
    @IBOutlet weak var bottomSeparatorView: UIView!
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var alert = UIAlertView()
    var delegate : AddNewBatteryDeleagate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.coreReturnsPickupAlertView.layer.cornerRadius = 10.0
        self.coreReturnsPickupAlertView.layer.borderWidth = 5.0
        self.coreReturnsPickupAlertView.layer.borderColor = UIColor.blackColor().CGColor
        
        self.topSeparatorView.layer.cornerRadius = 10.0
        self.topSeparatorView.layer.borderWidth = 5.0
        self.topSeparatorView.layer.borderColor = UIColor.blackColor().CGColor
        
        self.bottomSeparatorView.layer.cornerRadius = 10.0
        self.bottomSeparatorView.layer.borderColor = UIColor.blackColor().CGColor
        self.bottomSeparatorView.layer.borderWidth = 5.0
        
        
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession!.canAddInput(videoInput)) {
            captureSession!.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession!.canAddOutput(metadataOutput)) {
            captureSession!.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeQRCode,AVMetadataObjectTypeUPCECode,AVMetadataObjectTypeITF14Code,AVMetadataObjectTypeInterleaved2of5Code,AVMetadataObjectTypeFace,AVMetadataObjectTypeDataMatrixCode,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeCode39Mod43Code,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeAztecCode]
        } else {
            failed()
            return
        }
        
        self.readBarcode()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.running == false) {
            captureSession!.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.running == true) {
            captureSession!.stopRunning();
        }
    }
    func readBarcode() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        videoPreviewLayer!.frame = view.layer.bounds;
        videoPreviewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.cameraView.layer.addSublayer(videoPreviewLayer!)
        captureSession!.startRunning();
    }
    func failed() {
        
        self.alert.title = "Scanning not supported"
        self.alert.message = "Your device does not support scanning a code from an item. Please use a device with a camera."
        self.alert.addButtonWithTitle("OK")
        self.alert.show()
        
        captureSession = nil
    }
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        captureSession!.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            found(readableObject.stringValue);
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    func found(code: String) {
        self.alert.title = "Barcode Scanned"
        self.alert.message = code
        self.alert.addButtonWithTitle("OK")
        self.alert.show()
        
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        readBarcode()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func ManualEntryBtnTapped(sender: AnyObject) {
        delegate?.AddNewBattery()
        self.removeSuperViewInformation()
    }
    
    @IBAction func CameraBtnTapped(sender: AnyObject) {
        if (captureSession?.running == false) {
            captureSession!.startRunning();
        }
        delegate?.AddNewBattery()
        self.removeSuperViewInformation()
    }
    
    
    @IBAction func CancelBtnTapped(sender: AnyObject) {
        self.removeSuperViewInformation()
    }



}
