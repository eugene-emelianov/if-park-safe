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
        
        notificationManager?.scheduleNotification(identifier: "id1", title: "Area 1", subtitle: "Area 1 detected", body: "Test", latitude: 31.03, longitude: -56.00, radius: 2000, areaIdentifier: "Area 1", repeats: true)
        
        notificationManager?.scheduleNotification(identifier: "id2", title: "Area 2", subtitle: "Area 2 detected", body: "Test", timeInterval: 5)
        

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToArea1(_ sender: UIButton) {
        
        
    }

}

