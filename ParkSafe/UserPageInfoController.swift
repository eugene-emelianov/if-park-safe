//
//  UserPageInfo.swift
//  ParkSafe
//
//  Created by Sergey Gorlanov on 22.11.16.
//  Copyright © 2016 IF. All rights reserved.
//

import UIKit

class UserPageInfoController: UIViewController {
    @IBOutlet weak var PromoCodeText: UILabel!
    @IBOutlet weak var promoCodeLabel: UILabel!
    @IBOutlet weak var yourDiscountLabel: UILabel!
    @IBOutlet weak var spCount: UITextView!
    let storage = UserDefaults()
    @IBOutlet weak var parkingSpCount: UITextView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        toggleDiscountInfo()
        spCount.text = storage.string(forKey: "safetyPoints") ?? "0"
        parkingSpCount.text = storage.string(forKey: "safetyPoints") ?? "0"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        toggleDiscountInfo()
        spCount.text = storage.string(forKey: "safetyPoints") ?? "0"
        parkingSpCount.text = storage.string(forKey: "safetyPoints") ?? "0"
    }
    
    func toggleDiscountInfo() {
        var spState = storage.integer(forKey: "safetyPoints")
        
        if (spState > 10) {
            PromoCodeText.isHidden = false
            promoCodeLabel.isHidden = false
            yourDiscountLabel.isHidden = false
        } else {
            PromoCodeText.isHidden = true
            promoCodeLabel.isHidden = true
            yourDiscountLabel.isHidden = true
        }
    }
}
