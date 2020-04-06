//
//  ComonViewController.swift
//  Example.iOSBasic.Day3.AnhND47
//
//  Created by Nguyen Duy anh on 4/6/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ComonViewController: UIViewController {

    override func viewDidLoad() {
        if let fontSelected = UIFont(name: "HelveticaNeue", size: 14) {
            navigationController?.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: fontSelected], for: .selected)
            navigationController?.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
        }
        
        if let fontNomal = UIFont(name: "HelveticaNeue", size: 12) {
            navigationController?.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: fontNomal], for: .normal)
            navigationController?.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        }
    }
}
