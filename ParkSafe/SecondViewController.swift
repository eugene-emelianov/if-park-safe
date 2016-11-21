//
//  SecondViewController.swift
//  ParkSafe
//
//  Created by Katerina on 11/20/16.
//  Copyright © 2016 IF. All rights reserved.
//

import UIKit
import GoogleMaps


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.8683,
                                                          longitude: 151.2086, zoom: 12)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)

        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

