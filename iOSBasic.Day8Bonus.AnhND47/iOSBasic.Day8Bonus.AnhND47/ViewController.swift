//
//  ViewController.swift
//  iOSBasic.Day8Bonus.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet private var imageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "image2")
    }
}

extension 
