//
//  MainTabBarViewController.swift
//  Example.Day6.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/9/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class MainTabBarViewController: UIViewController {

    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet var tabBarButton: [UIButton]!
    private var viewControllers: [UIViewController] = [UIViewController]()
    private var selectedIndex: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactViewController = storyboard.instantiateViewController(withIdentifier: "ContactViewController")
        let recentlyViewController = storyboard.instantiateViewController(withIdentifier: "RecentlyViewController")
        let favoriteViewControllr = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController")
        viewControllers = [recentlyViewController, contactViewController, favoriteViewControllr]
        tabBarButton[selectedIndex].isSelected = true
        tabBarAction(tabBarButton[selectedIndex])
    }
    
    @IBAction func tabBarAction(_ sender: UIButton) {
        sender.pulsate()
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        tabBarButton[previousIndex].isSelected = false
        let previousViewController = viewControllers[previousIndex]
        
        previousViewController.willMove(toParent: nil)
        previousViewController.view.removeFromSuperview()
        previousViewController.removeFromParent()
        
        sender.isSelected = true
        let selectedView = viewControllers[selectedIndex]
        addChild(selectedView)
        selectedView.view.frame = mainContentView.bounds
        mainContentView.addSubview(selectedView.view)
        selectedView.didMove(toParent: self)
    }
    
}
