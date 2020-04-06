//
//  MainTabBarViewController.swift
//  Example.iOSBasic.Day3.AnhND47
//
//  Created by Nguyen Duy anh on 4/6/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTabBarItem()
        selectedIndex = 0
    }
    
    private func getTabBarItem () {
        guard let viewController = tabBarController?.viewControllers else { return }
        for view in viewController {
            view.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
            view.tabBarController?.tabBar.tintColor = .darkGray

        }    
    }
}
