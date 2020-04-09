//
//  ViewController.swift
//  Example2.Day5.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressCircle: CustomCircleView!
    
    @IBOutlet weak var circleView: CustomCircleView!
    @IBOutlet weak var componentView: CustomComponents!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentView.setTimeTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:))))
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
