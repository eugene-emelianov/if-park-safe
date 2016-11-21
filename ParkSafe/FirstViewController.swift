//
//  FirstViewController.swift
//  ParkSafe
//
//  Created by Eugene on 11/20/16.
//  Copyright © 2016 IF. All rights reserved.
//

import UIKit
import GoogleMaps

class FirstViewController: UIViewController {
    
    var notificationManager: NotificationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if notificationManager == nil{
            notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
        }

        let camera = GMSCameraPosition.camera(withLatitude: 56.9516026,
                                              longitude: 24.119115, zoom: 12)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(56.9516026, 24.119115)
        marker.title = "Riga"
        marker.snippet = "Latvia"
        marker.map = mapView
        
        addAlfa(mapView: mapView)
        addMarupe(mapView: mapView)
        addSlice(mapView: mapView)
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
        
        notificationManager?.scheduleNotification(identifier: "Marupe", title: "Car theft risk is high in Mārupe!", subtitle: "", body: "You are parking in Mārupe. Car theft risk is extremely high in this area, so do not leave your car unattended especially overnight. Based on our data 25 vehicles has been stolen here during last 12 months mostly to be split apart and sold in Lithuania.", latitude: 56.916645, longitude: 24.011521, radius: 500, areaIdentifier: "Marupe", repeats: true)
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
        
        notificationManager?.scheduleNotification(identifier: "Alfa", title: "Dear Līga, your BMW is at risk near Alfa!", subtitle: "", body: "Rear-view mirrors of BMWs are likely to be stolen here. A set of rear-view mirrors for BMW can cost up to 2000 EUR. So, try to avoid this parking area at best. If you decide to stay, please prefer outdoor parking area since CTV cameras are operating there.", latitude: 56.982832, longitude: 24.201361, radius: 500, areaIdentifier: "Alfa", repeats: true)
    }
    
    func addSlice(mapView: GMSMapView){
        
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

}

