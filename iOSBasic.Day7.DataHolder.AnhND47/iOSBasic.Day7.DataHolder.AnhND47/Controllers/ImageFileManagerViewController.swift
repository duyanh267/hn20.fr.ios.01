//
//  ImageFileManagerViewController.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/11/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit


class ImageFileManagerViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    let imageFileManager = ImageFileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFileManager.creatFolderDirectory("CachedImages")
        if let image = UIImage(named: "logo-gst.png") {
            let result = imageFileManager.saveImageFromDocument(image, "companyLogo.png", "CachedImages")
            print(result)
        }
        imageView.image = imageFileManager.loadImageNameFromDocuments("companyLogo.png", "CachedImages")
    }
}
