//
//  NotificationManager.swift
//  ParkSafe
//
//  Created by Eugene on 11/20/16.
//  Copyright © 2016 IF. All rights reserved.
//

import Foundation
import UserNotifications
import UserNotificationsUI
import CoreLocation

class NotificationManager{
    
    var locationManager = CLLocationManager()
    
    func registerForNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                if granted {
                    //self.application.registerForRemoteNotifications()
                        
                    if CLLocationManager.authorizationStatus() == .notDetermined {
                        self.locationManager.requestWhenInUseAuthorization()
                    }
                }
            }
        } else {
            //let settings = UIUserNotificationSettings(types: types, categories: nil)
            //self.application.registerUserNotificationSettings(settings)
            //self.application.registerForRemoteNotifications()
        }
    }
    
    @available(iOS 10.0, *)
    func setDelegate(delegate: UNUserNotificationCenterDelegate){
        UNUserNotificationCenter.current().delegate = delegate
    }
    
    func scheduleNotification(identifier: String, title: String, subtitle: String, body: String, timeInterval: TimeInterval, repeats: Bool = false) {
        if #available(iOS 10, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.body = body
            
            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: timeInterval, repeats: repeats)
            let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
    
    func scheduleNotification(identifier: String, title: String, subtitle: String, body: String, latitude: Double, longitude: Double, radius: Double, areaIdentifier: String, repeats: Bool = false) {
        if #available(iOS 10, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.body = body
        
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = CLCircularRegion(center: center, radius: radius, identifier: areaIdentifier)
            region.notifyOnEntry = true
            region.notifyOnExit = false
            let trigger = UNLocationNotificationTrigger(region: region, repeats: repeats)
            
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }

}
