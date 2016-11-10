//
//  JCICRScanPalletViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit
import AVFoundation

class JCICRScanPalletViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, UIAlertViewDelegate {
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var alert = UIAlertView()

    @IBOutlet var scanPreviewLayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.setNavigationItemTitle("Scan Pallets")
        self.setDriverInfoButton()
        alert.delegate = self

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
        self.scanPreviewLayer.layer.addSublayer(videoPreviewLayer!)
        captureSession!.startRunning();
    }
    func failed() {
      
        let alert = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

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
    

    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }
    
    func found(code: String) {
        alert.title = "Barcode Scanned"
        alert.message = code
        alert.addButtonWithTitle("OK")
        alert.show()

    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        readBarcode()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

}
