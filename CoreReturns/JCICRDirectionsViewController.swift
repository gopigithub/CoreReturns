//
//  JCICRDirectionsViewController.swift
//  CoreReturns
//
//  Created by Mobility on 07/11/16.
//  Copyright © 2016 Mobility. All rights reserved.
//

import UIKit
import GoogleMaps

class JCICRDirectionsViewController: UIViewController {

    @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationItemTitle("Direction")
        self.setDriverInfoButton()
    }
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.cameraWithLatitude(43.0578061, longitude: -88.1075132, zoom: 8.0)
        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
        mapView.myLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 43.0578061, longitude: -88.1075132)
        marker.title = "Milwaukee"
        marker.snippet = "America"
        marker.map = mapView

        let maker1 = GMSMarker()
        maker1.position = CLLocationCoordinate2D(latitude: 41.7460483, longitude: -88.2319227)
        maker1.title = "Naperville"
        maker1.snippet = "America"
        maker1.map = mapView
        
        let maker2 = GMSMarker()
        maker2.position = CLLocationCoordinate2D(latitude: 41.8336479, longitude: -87.8722388)
        maker2.title = "Naperville"
        maker2.snippet = "America"
        maker2.map = mapView
        
        
        let path = GMSMutablePath()
        path.addCoordinate(CLLocationCoordinate2D(latitude: 43.0578061, longitude: -88.1075132))
        path.addCoordinate(CLLocationCoordinate2D(latitude: 41.7460483, longitude: -88.2319227))
        path.addCoordinate(CLLocationCoordinate2D(latitude: 41.8336479, longitude: -87.8722388))
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 2.0
        polyline.geodesic = true
        polyline.spans = [GMSStyleSpan(color: UIColor.blackColor())]
        polyline.map = mapView
    }
    func btnDriverInfoTapped (sender: UIButton) {
        showDriverInformation()
        
    }

}
