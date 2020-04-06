//
//  DetailViewController.swift
//  Example.iOSBasic.Day3.AnhND47
//
//  Created by Nguyen Duy anh on 4/6/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var acount: String?
    var fullname: String?
    
    @IBOutlet weak var displayValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let acount = acount, let fullname = fullname {
            displayValueLabel.text = "hello: \(fullname) - \(acount)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func popToIndexView(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
   
}
