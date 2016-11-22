//
//  SecondViewController.swift
//  ParkSafe
//
//  Created by Katerina on 11/20/16.
//  Copyright © 2016 IF. All rights reserved.
//

import UIKit
import GoogleMaps


class SecondViewController: UIViewController, CLLocationManagerDelegate {

    var safetyPoints = 0
    var notificationManager: NotificationManager?
    var locationManager: CLLocationManager?
    var mapView: GMSMapView?
    var oldLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if notificationManager == nil{
            notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
        }
        
        if locationManager == nil {
            locationManager = getLocationManager()
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: 56.9516026,
                                              longitude: 24.119115, zoom: 12)
        mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        
        mapView?.isMyLocationEnabled = true;
        
        self.view = mapView
        
        addAlfa(mapView: mapView!)
        addMarupe(mapView: mapView!)
        addSpice(mapView: mapView!)
    }
    
    func getLocationManager() -> CLLocationManager {
        let manager = CLLocationManager()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        return manager
    }
    
    func addMarupe(mapView: GMSMapView) {
        
        let path = GMSMutablePath()
        
        path.add(CLLocationCoordinate2DMake(56.904067, 23.993930))
        path.add(CLLocationCoordinate2DMake(56.915782, 23.981742))
        path.add(CLLocationCoordinate2DMake(56.927400, 23.997535))
        path.add(CLLocationCoordinate2DMake(56.926557, 24.038905))
        path.add(CLLocationCoordinate2DMake(56.912216, 24.044989))
        path.add(CLLocationCoordinate2DMake(56.905848, 24.081306))
        path.add(CLLocationCoordinate2DMake(56.892911, 24.074611))
        path.add(CLLocationCoordinate2DMake(56.881002, 24.037189))
        path.add(CLLocationCoordinate2DMake(56.887660, 24.032897))
        path.add(CLLocationCoordinate2DMake(56.885785, 24.010581))
        path.add(CLLocationCoordinate2DMake(56.889629, 24.008693))
        path.add(CLLocationCoordinate2DMake(56.897505, 24.033927))
        path.add(CLLocationCoordinate2DMake(56.908285, 24.022597))
        path.add(CLLocationCoordinate2DMake(56.904067, 23.993930))
        
        let rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 2
        
        let solidRed = GMSStrokeStyle.solidColor(UIColor.red)
        rectangle.spans = [GMSStyleSpan(style: solidRed)]
        
        rectangle.map = mapView
        
    }
    
    
    func addAlfa(mapView: GMSMapView){
        
        let path = GMSMutablePath()
        
        path.add(CLLocationCoordinate2DMake(56.982832, 24.201361))
        path.add(CLLocationCoordinate2DMake(56.983393, 24.200846))
        path.add(CLLocationCoordinate2DMake(56.984404, 24.205030))
        path.add(CLLocationCoordinate2DMake(56.982935, 24.206042))
        path.add(CLLocationCoordinate2DMake(56.982836, 24.205141))
        path.add(CLLocationCoordinate2DMake(56.983666, 24.204358))
        path.add(CLLocationCoordinate2DMake(56.982832, 24.201361))
        
        let rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 2
        
        let solidRed = GMSStrokeStyle.solidColor(UIColor.red)
        rectangle.spans = [GMSStyleSpan(style: solidRed)]
        
        rectangle.map = mapView
        
    }
    
    func addSpice(mapView: GMSMapView){
        
        var path = GMSMutablePath()
        let solidRed = GMSStrokeStyle.solidColor(UIColor.red)
        
        path.add(CLLocationCoordinate2DMake(56.929469, 24.033065))
        path.add(CLLocationCoordinate2DMake(56.930897, 24.035565))
        path.add(CLLocationCoordinate2DMake(56.930452, 24.036402))
        path.add(CLLocationCoordinate2DMake(56.929351, 24.034181))
        path.add(CLLocationCoordinate2DMake(56.929469, 24.033065))
        
        var rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 2
        
        rectangle.spans = [GMSStyleSpan(style: solidRed)]
        
        rectangle.map = mapView
        
        path = GMSMutablePath()
        
        path.add(CLLocationCoordinate2DMake(56.930258, 24.037121))
        path.add(CLLocationCoordinate2DMake(56.930849, 24.038301))
        path.add(CLLocationCoordinate2DMake(56.930217, 24.039395))
        path.add(CLLocationCoordinate2DMake(56.929392, 24.039009))
        path.add(CLLocationCoordinate2DMake(56.930258, 24.037121))
        
        rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 2
        
        rectangle.spans = [GMSStyleSpan(style: solidRed)]
        
        rectangle.map = mapView
        
        notificationManager?.scheduleNotification(identifier: "Spice", title: "High risk of vandalism near Spice!", subtitle: "", body: "Dear Jānis, please keep an eye on your Volvo XC90 in Spice parking area! Headlights of Volvo has been stolen 5 times in 3 months here. Do you know a single headlight unit for your car costs about 3000 EUR? This makes your car a top choice for thefts. Do not leave it unattended here.", latitude: 56.930258, longitude: 24.037121, radius: 100, areaIdentifier: "Spice", repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToArea1(_ sender: UIButton) {
        
        
    }
    
    func startUpdatingLocation() {
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let defaults = UserDefaults()
        
        
        let latestLocation = locations.last
        
        if oldLocation != nil {
            if let distanceToOldLocation = latestLocation?.distance(from: oldLocation!) {
                if (distanceToOldLocation > 10 ) {
                    let camera = GMSCameraPosition.camera(withLatitude:
                        (latestLocation?.coordinate.latitude)!, longitude:(latestLocation?.coordinate.longitude)!, zoom:14)
                    self.mapView?.animate(to: camera)
                }
            }
        } else {
            let camera = GMSCameraPosition.camera(withLatitude:
                (latestLocation?.coordinate.latitude)!, longitude:(latestLocation?.coordinate.longitude)!, zoom:14)
            self.mapView?.animate(to: camera)
            
        }
        oldLocation = latestLocation
        
        let spiceLocation = CLLocation(latitude: 56.930258, longitude: 24.037121)
        let marupeLocation = CLLocation(latitude: 56.916645, longitude: 24.011521)
        let alfaLocation = CLLocation(latitude: 56.982832, longitude: 24.201361)
        
        let spiceDistance = latestLocation?.distance(from: spiceLocation)
        let marupeDistance = latestLocation?.distance(from: marupeLocation)
        let alfaDistance = latestLocation?.distance(from: alfaLocation)
        
        let inSpice = Double(spiceDistance ?? 0) < 100.00
        let inMarupe = Double(marupeDistance ?? 0) < 100.00
        let inAlfa = Double(alfaDistance ?? 0) < 100.00
        //print("distance not determined: \(distance == nil)")
        
        //print("distance: \(distance)")
        let currentPoints = defaults.integer(forKey: "safetyPoints")
        
        if inSpice || inMarupe || inAlfa {
            if (Int(currentPoints) > 0) {
                defaults.set(currentPoints - 1, forKey: "safetyPoints")
            }
        } else {
            defaults.set(currentPoints + 1, forKey: "safetyPoints")
        }
        
        print("sp: \(defaults.integer(forKey: "safetyPoints"))")
        
        let latitude = String(format: "%.4f", latestLocation!.coordinate.latitude)
        let longitude = String(format: "%.4f", latestLocation!.coordinate.longitude)
        
        print("Lat: \(latitude), Long: \(longitude)")
        
    }

}
