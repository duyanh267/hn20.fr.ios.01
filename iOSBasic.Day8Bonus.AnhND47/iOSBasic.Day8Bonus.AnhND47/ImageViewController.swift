//
//  ViewController.swift
//  iOSBasic.Day8Bonus.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var imageViewRight: UIImageView!
    
    private var swipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    private var swipeLeftGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    private var swipeRightGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    private var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private var singleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    private var doubleTapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    private var rotateGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let swipe = swipeImageGesture()
        panImageGesture(swipeGestures: swipe)
        tapImageGesture()
        rotateImageGesture()
    }
    
    
}


// MARK: - Swipe Gesture Regconizer
extension ImageViewController {
    private func setupUI() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.3
        scrollView.maximumZoomScale = 4.0
        imageView.frame = CGRect(x: 0, y: 84, width: 414, height: 738)
        imageView.image = UIImage(named: "image2")
        imageView.isUserInteractionEnabled = true
        
        imageViewLeft.frame = CGRect(x: -414, y: 84, width: 414, height: 738)
        imageViewLeft.image = UIImage(named: "image7")
        imageViewLeft.isUserInteractionEnabled = true
        
        imageViewRight.frame = CGRect(x: 414, y: 84, width: 414, height: 738)
        imageViewRight.image = UIImage(named: "image4")
        imageViewRight.isUserInteractionEnabled = true
        
    }
    
    private func swipeImageGesture() -> [UISwipeGestureRecognizer] {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeGesture.direction = .left
        imageView.addGestureRecognizer(swipeGesture)
        
        swipeGesture =  UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeGesture.direction = .right
        imageView.addGestureRecognizer(swipeGesture)
        
        swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeftGesture.direction = .left
        imageViewLeft.addGestureRecognizer(swipeLeftGesture)
        
        swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRightGesture.direction = .right
        imageViewRight.addGestureRecognizer(swipeRightGesture)
        
        return [swipeGesture, swipeLeftGesture, swipeRightGesture]
    }
    
    @objc private func swipeLeft() {
        UIView.animate(withDuration: 0.5) {
            self.imageView.frame = self.imageView.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
            self.imageViewRight.frame = self.imageViewRight.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
            self.imageViewLeft.frame = self.imageViewLeft.frame.offsetBy(dx: -self.view.bounds.size.width, dy: 0.0)
        }
    }
    
    @objc private func swipeRight() {
        UIView.animate(withDuration: 0.5) {
            self.imageView.frame = self.imageView.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
            self.imageViewRight.frame = self.imageViewRight.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
            self.imageViewLeft.frame = self.imageViewLeft.frame.offsetBy(dx: self.view.bounds.size.width, dy: 0.0)
        }
    }
    
}


// MARK: - Pan Gesture Recognizer
extension ImageViewController {
    private func panImageGesture(swipeGestures: [UISwipeGestureRecognizer]) {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        for swipeGesture in swipeGestures {
            panGesture.require(toFail: swipeGesture)
        }
        imageView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ panGesture: UIPanGestureRecognizer) {
        let pointTouch: CGPoint = panGesture.location(in: view)
        imageView.center = pointTouch
    }
}

// MARK: - ScrollView Delegate
extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

//MARK: - Tap Gesture Recognizer
extension ImageViewController {
    func tapImageGesture() {
        singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTapGesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(singleTapGesture)
        
        doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc private func handleSingleTap() {
        imageView.image = UIImage(named: "image4")
    }
    
    @objc private func handleDoubleTap() {
           imageView.image = UIImage(named: "image5")
       }
}

//MARK: - Rotate Gesture Recognizer
extension ImageViewController {
    func rotateImageGesture() {
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imageView.addGestureRecognizer(rotateGesture)
    }
    
    @objc private func handleRotate() {
        imageView.transform = CGAffineTransform(rotationAngle: rotateGesture.rotation)
    }
}
