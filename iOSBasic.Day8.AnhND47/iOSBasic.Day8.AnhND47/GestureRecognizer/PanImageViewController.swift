//
//  PanImageViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class PanImageViewController: UIViewController {
    @IBOutlet private weak var panImageView: UIImageView!
    
    private var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleEvent()
    }

}

extension PanImageViewController {
    func handleEvent() {
        panImageView.image = UIImage(named: "backgroundImage")
        panImageView.isUserInteractionEnabled = true
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panImageView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ panGesture: UIPanGestureRecognizer) {
        let pointTouch: CGPoint = panGesture.location(in: view)
        panImageView.center = pointTouch
    }
}
