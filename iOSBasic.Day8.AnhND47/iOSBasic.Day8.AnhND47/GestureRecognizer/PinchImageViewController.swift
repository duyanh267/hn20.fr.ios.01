//
//  PinchImageViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class PinchImageViewController: UIViewController {
    @IBOutlet private weak var pinchImageView: UIImageView!
    private var pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEvent()
    }
}

extension PinchImageViewController {
    func handleEvent() {
        pinchImageView.image = UIImage(named: "backgroundImage")
        pinchImageView.isUserInteractionEnabled = true
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handleImagePinchGesture))
        pinchImageView.addGestureRecognizer(pinchGesture)
    }
    
    
    @objc private func handleImagePinchGesture(_ pinchGesture: UIPinchGestureRecognizer) {
        pinchImageView.transform = CGAffineTransform(scaleX: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 0
    }
}
