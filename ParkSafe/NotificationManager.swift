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

class NotificationManager{
    
    func registerForNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                if granted {
                    //self.application.registerForRemoteNotifications()
                }
            }
        } else {
            //let settings = UIUserNotificationSettings(types: types, categories: nil)
            //self.application.registerUserNotificationSettings(settings)
            //self.application.registerForRemoteNotifications()
        }
    }
    
    func scheduleNotification(identifier: String, title: String, subtitle: String, body: String, timeInterval: TimeInterval, repeats: Bool = false) {
        if #available(iOS 10, *) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.body = body
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
