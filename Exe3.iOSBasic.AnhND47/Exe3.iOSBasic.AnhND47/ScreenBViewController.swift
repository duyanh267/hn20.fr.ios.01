//
//  ScreenBViewController.swift
//  Exe3.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/2/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ScreenBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ScreenB viewWillAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ScreenB viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ScreenB viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ScreenB viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ScreenB viewDidDisappear")
    }
    
    @IBAction func backToScreenA(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
