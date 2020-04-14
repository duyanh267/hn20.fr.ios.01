//
//  RotateImageViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class RotateImageViewController: UIViewController {
    @IBOutlet private weak var rotateImageView: UIImageView!
    
    private var rotateGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEvents()
    }
}

extension RotateImageViewController {
    private func handleEvents() {
        rotateImageView.image = UIImage(named: "backgroundImage")
        rotateImageView.isUserInteractionEnabled = true
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handlerotateGesture))
        rotateImageView.addGestureRecognizer(rotateGesture)
    }
    
    @objc private func handlerotateGesture(_ rotateGesture: UIRotationGestureRecognizer) {
        rotateImageView.transform = CGAffineTransform(rotationAngle: rotateGesture.rotation)
    }
}
