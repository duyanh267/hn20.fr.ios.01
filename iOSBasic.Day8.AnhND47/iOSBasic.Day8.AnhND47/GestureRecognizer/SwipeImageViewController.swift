//
//  SwipeImageViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class SwipeImageViewController: UIViewController {
    
    @IBOutlet private weak var swipeImageView: UIImageView!
    @IBOutlet private weak var swipeImageViewLeft: UIImageView!
    @IBOutlet private weak var swipeImageViewRight: UIImageView!
    
    private var swipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    private var swipeLeftGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    private var swipeRightGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        handleEvents()
    }
}

extension SwipeImageViewController {
    private func setupImage() {
        swipeImageView.image = UIImage(named: "backgroundImage")
        swipeImageView.isUserInteractionEnabled = true
        swipeImageViewLeft.image = UIImage(named: "ibra")
        swipeImageViewLeft.isUserInteractionEnabled = true
        swipeImageViewRight.image = UIImage(named: "manU")
        swipeImageViewRight.isUserInteractionEnabled = true
    }
    
    private func handleEvents() {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeGesture.direction = .left
        swipeImageView.addGestureRecognizer(swipeGesture)
        
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeGesture.direction = .right
        swipeImageView.addGestureRecognizer(swipeGesture)
        
        swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeftGesture.direction = .left
        swipeImageViewLeft.addGestureRecognizer(swipeLeftGesture)
        
        swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRightGesture.direction = .right
        swipeImageViewRight.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc private func swipeLeft() {
        UIView.animate(withDuration: 0.5) {
            self.swipeImageView.frame = self.swipeImageView.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
            self.swipeImageViewRight.frame = self.swipeImageViewRight.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
            self.swipeImageViewLeft.frame = self.swipeImageViewLeft.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
        }
    }
    
    @objc private func swipeRight() {
        UIView.animate(withDuration: 0.5) {
            self.swipeImageView.frame = self.swipeImageView.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
            self.swipeImageViewRight.frame = self.swipeImageViewRight.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
            self.swipeImageViewLeft.frame = self.swipeImageViewLeft.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
        }
    }
}
