//
//  KeyChainViewController.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/12/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class KeyChainViewController: UIViewController {

    @IBOutlet private weak var saveKeyTextField: UITextField!
    @IBOutlet private weak var saveValueTextField: UITextField!
    @IBOutlet private weak var loadKeyTextField: UITextField!
    @IBOutlet private weak var loadDataForKeyTextField: UITextField!
    @IBOutlet private weak var deleteForKeyTextField: UITextField!
    
    var keychainWrapper = KeyChainWrapper()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func saveDataKeyChainButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func loadDataKeyChainButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func deleteDataKeyChainButton(_ sender: UIButton) {
        
    }
}
