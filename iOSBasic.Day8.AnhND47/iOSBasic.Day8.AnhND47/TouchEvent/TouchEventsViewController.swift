//
//  TouchEventsViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class TouchEventsViewController: UIViewController {
    
 
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var childImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.isUserInteractionEnabled = true
        childImage.isUserInteractionEnabled = true        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VIEW CONTROLLER IS TOUCHED!")
    }
}
