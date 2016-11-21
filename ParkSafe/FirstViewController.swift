//
//  FirstViewController.swift
//  ParkSafe
//
//  Created by Eugene on 11/20/16.
//  Copyright © 2016 IF. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var notificationManager: NotificationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if notificationManager == nil{
            notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
        }
        
        notificationManager?.scheduleNotification(identifier: "id1", title: "Area 1", subtitle: "Area 1 detected", body: "Test", latitude: 31.03, longitude: -56.00, radius: 2000, areaIdentifier: "Area 1")
        
        notificationManager?.scheduleNotification(identifier: "id2", title: "Area 2", subtitle: "Area 2 detected", body: "Test", timeInterval: 5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToArea1(_ sender: UIButton) {
        
        
    }

}

