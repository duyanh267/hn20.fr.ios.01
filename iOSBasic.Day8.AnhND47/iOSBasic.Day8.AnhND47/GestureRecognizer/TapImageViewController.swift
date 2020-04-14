//
//  TapImageViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class TapImageViewController: UIViewController {
    @IBOutlet private weak var tapImageView: UIImageView!
    private var signleTapImageGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    private var doubleTapImageGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    private var longTapImageGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEvents()
    }   
}
// Handle Events
extension TapImageViewController {
    private func handleEvents() {
        tapImageView.image = UIImage(named: "backgroundImage")
        tapImageView.isUserInteractionEnabled = true
        
        signleTapImageGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        signleTapImageGesture.numberOfTapsRequired = 1
        tapImageView.addGestureRecognizer(signleTapImageGesture)
        
        doubleTapImageGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapImageGesture.numberOfTapsRequired = 2
        tapImageView.addGestureRecognizer(doubleTapImageGesture)
        
        // TODO: LongGestureRecognizer
        longTapImageGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongTap))
        longTapImageGesture.minimumPressDuration = 3
        tapImageView.addGestureRecognizer(longTapImageGesture)
    }
    
    @objc private func handleSingleTap() {
        tapImageView.image = UIImage(named: "ibra")
    }
    
    @objc private func handleDoubleTap() {
        tapImageView.image = UIImage(named: "backgroundImage")
    }
    
    @objc private func handleLongTap() {
        tapImageView.image = UIImage(named: "manU")
    }
}

