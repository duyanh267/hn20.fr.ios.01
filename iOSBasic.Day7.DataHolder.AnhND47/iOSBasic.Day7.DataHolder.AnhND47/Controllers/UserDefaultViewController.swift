//
//  UserDefaultViewController.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/10/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {
    private let userDefaultManager = UserDefaultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaultManager.saveUserName("AnhND47")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let name = userDefaultManager.getUserName() {
            print("\(name)")
        } else {
            print("Error get data")
        }
    }
}
